part of 'categories_bloc.dart';

abstract class CategoriesEvent extends Equatable {}

class AddCategoriesEvent extends CategoriesEvent{
  final int  id;
  final String idDoc;
  final String  name;
  final String  image;
  final String  type;
  final String  createdAt;
  final String  updatedAt;

  AddCategoriesEvent({
    required this.id,
    required this.idDoc,
    required this.name,
    required this.image, 
    required this.type, 
    required this.updatedAt, 
    required this.createdAt
  });
  
  @override
  List<Object?> get props => [
    image,
    name,
    type,
    createdAt,
    updatedAt,
  ];
}

class GetAllCategoriesEvent extends CategoriesEvent{
  @override
  List<Object?> get props => [];
}
class GetCategoriesLoadingEvent extends CategoriesEvent{
  @override
  List<Object?> get props => [];
}

class GetCategoriesShippingEvent extends CategoriesEvent{

  @override
  List<Object?> get props => [];
}