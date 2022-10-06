part of 'shipping_bloc.dart';

abstract class ShippingEvent extends Equatable {
  const ShippingEvent();

  @override
  List<Object> get props => [];
}

class CreateShippingEvent extends ShippingEvent{
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

  const CreateShippingEvent({ 
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
class UpdateShippingEvent extends ShippingEvent{
    final String collectionIdDoc;
    final String idDoc;
    final String name;
    final String image;
    final String region;
    final double price;
    final String type;
    final String updatedAt;

  const UpdateShippingEvent({
    required this.collectionIdDoc,
    required this.idDoc,
    required this.name,
    required this.image,
    required this.region,
    required this.price,
    required this.type,
    required this.updatedAt,
  });

  @override
  List<Object> get props => [
    collectionIdDoc,
    idDoc,
    name,
    image,
    region,
    price,
    type,
    updatedAt,
  ];
}

class DeleteSippingEvent extends ShippingEvent{
  final String collectionIdDoc;
  final dynamic idDoc;
  final String type;
  final String refFromURL;
  const DeleteSippingEvent({
    required this.collectionIdDoc,
    required this.idDoc,
    required this.refFromURL,
    required this.type,
  });
}

class GetShippingLoadedEvent extends ShippingEvent{
 
 @override
  List<Object> get props => [];
}

class ShippingLoadingEvent extends ShippingEvent{
 
 @override
  List<Object> get props => [];
}