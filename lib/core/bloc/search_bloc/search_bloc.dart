import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:m_hany_store/core/model/search_model.dart';
import 'package:m_hany_store/core/repositories/common/search_repository.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchRepository searchRepository;
  SearchBloc({required this.searchRepository}) : super(SearchInitial()) {
    on<SearchEvent>((event, emit) {});
    on<GetSearchLoadedEvent>((event, emit) async{
      await Future.delayed(const Duration(seconds: 1));
      try{
       final getData =  await searchRepository.getShippingModel();
        emit(SearcLoadedState(getData));
      }catch (e){
        emit(SearchErrorState(e.toString()));
      }
    }); 

      on<CreateSearchEvent>((event, emit) async{
        await Future.delayed(const Duration(seconds: 1));
        try{
          searchRepository.createSearchByCategory(
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
        }catch (e){
        emit(SearchErrorState(e.toString()));
      }
      });
  }
}
