part of 'api_data_bloc.dart';

abstract class DataState extends Equatable {
  const DataState();
  
  @override
  List<Object> get props => [];
}

class DataLoadingState extends DataState {}

class DataLoadedState<T> extends DataState {
  final List<T> data;
  const DataLoadedState({required this.data});
}