// ignore_for_file: must_be_immutable

part of 'categories_bloc.dart';

abstract class CategoriesState extends Equatable {
  const CategoriesState();
}

class CategoriesInitial extends CategoriesState {
  @override
  List<Object?> get props => [];
}

class CategoriesLoadingState extends CategoriesState {
  @override
  List<Object?> get props => [];
}

class AddCategoriesState extends CategoriesState {
  @override
  List<Object?> get props => [];
}


class CategoriesErrorState extends CategoriesState {
  final String error;

  const CategoriesErrorState(this.error);
  @override
  List<Object?> get props => [error];
}

class GetCategoriesLoadedState extends CategoriesState {

  List<CategoriesModel> categoriesModel = [];
  
  GetCategoriesLoadedState(this.categoriesModel);

  @override
  List<Object?> get props => [categoriesModel];
}
class DeleteCategoriesState extends CategoriesState{
  @override
  List<Object?> get props => [];
}