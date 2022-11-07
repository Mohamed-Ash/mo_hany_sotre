import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:m_hany_store/core/bloc/criteria/where_criteria.dart';
import 'package:m_hany_store/core/model/_model_interface.dart';


part 'api_data_event.dart';
part 'api_data_state.dart';

class ApiDataBloc<T> extends Bloc<DataEvent, DataState> {

  String? collectionName;
  Function? factory;

  Type get type => T;

  ApiDataBloc() : super(DataLoadingState()) {
    on<IndexDataEvent>(_index);
    on<DeleteDataEvent>(_delete);
    on<UpdateDataEvent>(_update);
    on<StoreDataEvent>(_store);
    on<StreamDataEvent>(_getChatMessage);
    on<DeleteMessageDataEvent>(_deleteMessage);
    on<StoreMessageDataEvent>(_storeMesage);

    ModelClass? modelClass = ModelInterface.getModelClass(type);
    collectionName = modelClass?.collection;
    factory = modelClass?.factory;

    if (collectionName == null || collectionName!.isEmpty) {
      throw Exception('No Found Collection for $type');
    }

    if (factory == null) {
      throw Exception('No Found Factory (From Json) for $type');
    }
  }

  void _index(IndexDataEvent event, Emitter emit) async {
    emit(DataLoadingState());
    Query<Map<String, dynamic>> collection;
    if (event.where == null) {
      collection = FirebaseFirestore.instance.collection(collectionName!);
    } else {
      collection = FirebaseFirestore.instance.collection(collectionName!).where(
        event.where!.field,
        arrayContains: event.where!.arrayContains,
        arrayContainsAny: event.where!.arrayContainsAny,
        isEqualTo: event.where!.isEqualTo,
        isGreaterThan: event.where!.isGreaterThan,
        isGreaterThanOrEqualTo: event.where!.isGreaterThanOrEqualTo,
        isLessThan: event.where!.isLessThan,
        isLessThanOrEqualTo: event.where!.isLessThanOrEqualTo,
        isNotEqualTo: event.where!.isNotEqualTo,
        isNull: event.where!.isNull,
        whereIn: event.where!.whereIn,
        whereNotIn: event.where!.whereNotIn,
      );
    }
    
    final collectionData = await collection.get();

    List<T> data = [];
    for (var element in collectionData.docs) {
      data.add(factory?.call(element.data()));
    }
    emit(DataLoadedState<T>(data: data));
  }

  void _delete(DeleteDataEvent event, Emitter emit) async {
    emit(DataLoadingState());
   
    final collectionData = FirebaseFirestore.instance.collection(collectionName!);
   
    var data = await collectionData.get();
   
    QueryDocumentSnapshot<Map<String, dynamic>> doc = data.docs.firstWhere((element) {
      return element.data()[event.modelKey] == event.id;
    });
    await collectionData.doc(doc.id).delete();

    var modelMap = doc.data();
    
    if (event.files != null && event.files!.isNotEmpty) {
      for (var file in event.files!) {
        if (modelMap.containsKey(file)) {
          if (modelMap[file] is String) {
            await FirebaseStorage.instance.refFromURL(modelMap[file]).delete();
          } else if (modelMap[file] is List<String> && modelMap[file] != null && modelMap[file].isNotEmpty) {
            for (var element in modelMap[file]) {
              await FirebaseStorage.instance.refFromURL(modelMap[file][element]).delete();
            }
          }
        }
      }
    }
   
    data = await collectionData.get();
   
    List<T> result = [];
   
    for (var element in data.docs) {
      result.add(factory?.call(element.data()));
    }
    emit(DataLoadedState<T>(data: result));
  }
  
  void _update(UpdateDataEvent event, Emitter emit) async {
    emit(DataLoadingState());

    final collectionData = FirebaseFirestore.instance.collection(collectionName!);
    var data = await collectionData.get();
    String docId = data.docs.firstWhere((element) => element.data()[event.modelKey] == event.id).id;
    collectionData.doc(docId).update(event.data);

    data = await collectionData.get();
    List<T> result = [];
    for (var element in data.docs) {
      result.add(factory?.call(element.data()));
    }
    emit(DataLoadedState<T>(data: result));
  }

  void _store(StoreDataEvent event, Emitter emit) async {
    emit(DataLoadingState());

    final collectionData = FirebaseFirestore.instance.collection(collectionName!);
    collectionData.add(event.data);

    var data = await collectionData.get();
    List<T> result = [];
    for (var element in data.docs) {
      result.add(factory?.call(element.data()));
    }
    emit(DataLoadedState<T>(data: result));
  }

  void _getChatMessage(StreamDataEvent event, Emitter emit) async {
      emit(DataLoadingState());
      Query<Map<String, dynamic>> collection;
      
    collection = FirebaseFirestore.instance.collection(collectionName!);
      
    final collectionData = await collection.orderBy('date_message').get();

    List<T> data = [];
    for (var element in collectionData.docs) {
      data.add(factory?.call(element.data()));
    }
    emit(DataLoadedState(data: data));
  }

  void _deleteMessage(DeleteMessageDataEvent event, Emitter emit) async {
    emit(DataLoadingState());
   
    final collectionData = FirebaseFirestore.instance.collection(collectionName!);
   
    var data = await collectionData.orderBy('date_message').get();
   
    QueryDocumentSnapshot<Map<String, dynamic>> doc = data.docs.firstWhere((element) {
      return element.data()[event.modelKey] == event.id;
    });
    await collectionData.doc(doc.id).delete();

    var modelMap = doc.data();
    
    if (event.files != null && event.files!.isNotEmpty) {
      for (var file in event.files!) {
        if (modelMap.containsKey(file)) {
          if (modelMap[file] is String) {
            await FirebaseStorage.instance.refFromURL(modelMap[file]).delete();
          } else if (modelMap[file] is List<String> && modelMap[file] != null && modelMap[file].isNotEmpty) {
            for (var element in modelMap[file]) {
              await FirebaseStorage.instance.refFromURL(modelMap[file][element]).delete();
            }
          }
        }
      }
    }
   
    data = await collectionData.orderBy('time_now').get();
   
    List<T> result = [];
   
    for (var element in data.docs) {
      result.add(factory?.call(element.data()));
    }
    emit(DataLoadedState<T>(data: result));
  }

   void _storeMesage(StoreMessageDataEvent event, Emitter emit) async {
    emit(DataLoadingState());

    final collectionData = FirebaseFirestore.instance.collection(collectionName!);
    collectionData.add(event.data);

    var data = await collectionData.orderBy('time_now').get();
    List<T> result = [];
    for (var element in data.docs) {
      result.add(factory?.call(element.data()));
    }
    emit(DataLoadedState<T>(data: result));
  }
}