part of 'categories_bloc.dart';

abstract class CategoriesEvent extends Equatable {}

class AddCategoriesEvent extends CategoriesEvent{
  final int? id;
  final String? idDoc;
  final String?  name;
  final String?  image;
  final String?  type;
  final String? createdAt;
  final String?  updatedAt;

  AddCategoriesEvent({
    this.id,
    this.idDoc,
    this.name,
    this.image, 
    this.type, 
    this.updatedAt, 
    this.createdAt
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
class DeleteCategoriesEvent extends CategoriesEvent{
  final int  id;
  final String idDoc;

  DeleteCategoriesEvent({
    required this.id,
    required this.idDoc,
  });

    @override
  List<Object?> get props => [
    id,
    idDoc,
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