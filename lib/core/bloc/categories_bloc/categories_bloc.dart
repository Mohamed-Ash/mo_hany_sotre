/* import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:m_hany_store/core/model/category_model.dart';
import 'package:m_hany_store/core/repositories/admin/categories_ropository.dart';

part 'categories_event.dart';
part 'categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  CategoriesRpoSitory categoriesRpoSitory;
  // List<CategoriesModel> categoriesModel;
  CategoriesBloc({required this.categoriesRpoSitory,}) : super(CategoriesInitial()){
    on<CategoriesEvent>((event, emit) {});
    /* on<GetCategoriesLoadingEvent>((event, emit) => emit(CategoriesLoadingState()));
    on<GetAllCategoriesEvent>((event, emit) => emit(GetCategoriesState(categoriesModel)));
    // on<GetAllCategoriesEvent>(_show);
    on<AddCategoriesEvent>((event, emit) => emit(AddCategoriesState()));
    on<GetCategoriesShippingEvent>((event, emit) => emit(GetCategoriesSthippngState(categoriesModel))); */
    on<AddCategoriesEvent>((event, emit) async {
      emit(CategoriesLoadingState());
      await Future.delayed(const Duration(seconds: 1));
      try {
       await categoriesRpoSitory.creteCtegories(
        idDoc: event.idDoc!,
          id: event.id!,
          name: event.name!, 
          image: event.image!,
          type: event.type!, 
          createdAt: event.createdAt!, 
          updatedAt: event.updatedAt!,
        );
      } catch (e) {
        emit(CategoriesErrorState(e.toString()));
      }
    });

    on<GetAllCategoriesEvent>((event, emit) async {
      emit(CategoriesLoadingState());
      await Future.delayed(const Duration(seconds: 1));
      try {
        final getData = await categoriesRpoSitory.getCategoriesModel();
        emit(GetCategoriesLoadedState(getData));
      } catch (e) {
         emit(CategoriesErrorState(e.toString()));
      }
    });

    on<DeleteCategoriesEvent>((event, emit) async {
      emit(CategoriesLoadingState());
      await Future.delayed(const Duration(seconds: 1));
      try {
        
        emit(DeleteCategoriesState());
      } catch (e) {
         emit(CategoriesErrorState(e.toString()));
      }
    }); */

    /* on<CategoriesEmptyEvent>((event, emit) async {
       final getData =  await categoriesRpoSitory.getCategoriesModel();
       if(getData.isEmpty ){
        emit(CategoriesEmptyState('categories page is empty Please add a Ctegories'));
       }else{

       }
    }); */
  



 /*  Stream<CategoriesState> mapEventTOState(CategoriesEvent event)async*{
    if(event is GetAllCategoriesEvent){
      yield CategoriesLoadingState();
      
      var getAllCategories = await categoriesRpoSitory.getCategoriesModel();
      debugPrint('gtetd data ');
      debugPrint('+++===============');
      yield GetCategoriesState(getAllCategories);

    }else if(event is AddCategoriesEvent){
      categoriesRpoSitory.addEmp(
        CategoriesModel(
          images: event.images, 
          name: event.name, 
          type: event.type, 
          createdAt: event.createdAt, 
          updatedAt: event.updatedAt
          )
        );
      
      yield AddCategoriesState();
    } else if(event is GetCategoriesShippingEvent){
      
      yield CategoriesLoadingState();
      
      var getCategoriesShipping = await  categoriesRpoSitory.getCategoriesShipping();
      
      yield GetCategoriesSthippngState(getCategoriesShipping);
    }
  } */

  /* Stream<GetCategoriesState> _show(CategoriesEvent event, Emitter<CategoriesState> emet)async*{
    if(event is GetAllCategoriesEvent){
      emit(GetCategoriesState(categoriesModel!));
      // yield CategoriesLoadingState();
      var getAllCategories = await categoriesRpoSitory.getAllCategories();
      
      yield GetCategoriesState(getAllCategories);

    }
  } */
// }
