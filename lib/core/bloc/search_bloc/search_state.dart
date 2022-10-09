part of 'search_bloc.dart';

abstract class SearchState extends Equatable {
  const SearchState();
  
  @override
  List<Object> get props => [];
}

class SearchInitial extends SearchState {

  @override
  List<Object> get props => [];
}

class SearcLoadingState extends SearchState {
  
  @override
  List<Object> get props => [];
}

class SearcLoadedState extends SearchState {
  final List<SearchModel> searchMode;

  const SearcLoadedState(this.searchMode);

  @override
  List<Object> get props => [searchMode];

}


class SearchErrorState extends SearchState{
 final String error;

  const SearchErrorState(this.error);
  @override
  List<Object> get props => [error];
}