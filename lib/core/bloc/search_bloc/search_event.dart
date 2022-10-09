part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}
class CreateSearchEvent extends SearchEvent{
  ///document id
  final int id;
  final String idDoc;
  final String name;
  final String image;
  final String region;
  final double price;
  final String type;
  final String createdAt;
  final String updatedAt;

  const CreateSearchEvent({ 
    required this.id,
    required this.idDoc,
    required this.name, 
    required this.image, 
    required this.region, 
    required this.price, 
    required this.type, 
    required this.createdAt, 
    required this.updatedAt 
    });

 @override
  List<Object> get props => [
    name,
    image,
    region,
    price,
    type,
    idDoc,
    id,
    createdAt,
    updatedAt
  ];
}

class GetSearchLoadedEvent extends SearchEvent{
 
 @override
  List<Object> get props => [];
}

class SearchLoadingEvent extends SearchEvent{
 
 @override
  List<Object> get props => [];
}

