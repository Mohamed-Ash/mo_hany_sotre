import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:m_hany_store/core/model/category_model.dart';
import 'package:m_hany_store/core/model/shipping_model.dart';
import 'package:m_hany_store/core/repositories/admin/shipping_repository.dart';

part 'shipping_event.dart';
part 'shipping_state.dart';

class ShippingBloc extends Bloc<ShippingEvent, ShippingState> {
  ShippingRepository shippingRepository;
  CategoriesModel categoriesModel;

  ShippingBloc({required this.shippingRepository, required this.categoriesModel}) : super(ShippingInitial()) {
    on<ShippingEvent>((event, emit) {});

    on<CreateShippingEvent>((event, emit) async{
      await Future.delayed(const Duration(seconds: 1));
      try{
        await shippingRepository.createShippingByCategory(
          id: event.id,
          idDoc: event.idDoc,
          name: event.name,
          image: event.image,
          region: event.region,
          price: event.price,
          type: event.type,
          createdAt: event.createdAt, 
          updatedAt: event.updatedAt
        );
      }catch(e){
        emit(ShippingErrorState(e.toString()));
      }
    });
    on<GetShippingLoadedEvent>((event, emit) async{
      emit(ShippingLoadingState());
      
      await Future.delayed(const Duration(seconds: 1));
      
      try{
        final getData = await shippingRepository.getShippingModel(idDoc: categoriesModel.idDoc,type: categoriesModel.type);
        emit(ShippingLoadedState(getData));

      } catch (e){
        emit(ShippingErrorState(e.toString()));
      }
    });
    on<UpdateShippingEvent>((event, emit) async{
      await Future.delayed(const Duration(seconds: 1));
      try{
        shippingRepository.updateShippingByCategory(
          collectionIdDoc: event.collectionIdDoc, 
          idDoc: event.idDoc, 
          name: event.name, 
          image: event.image, 
          region: event.region, 
          price: event.price, 
          type: event.type, 
          updatedAt: event.updatedAt,
        );
      }catch(e){
        emit(ShippingErrorState(e.toString()));
      }
    });

    on<DeleteSippingEvent>((event, emit) async{
      await Future.delayed(const Duration(seconds: 1));
      try{
        shippingRepository.deleteShippingByCategory(
          collectionIdDoc: event.collectionIdDoc, 
          idDoc: event.idDoc, 
          type: event.type, 
          refFromURL: event.refFromURL
        );
        emit(DeleteSippingState());
      }catch(e){
        emit(ShippingErrorState(e.toString()));
      }
    });
  }
}
