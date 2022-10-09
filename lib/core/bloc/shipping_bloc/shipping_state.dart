part of 'shipping_bloc.dart';

abstract class ShippingState extends Equatable {
  const ShippingState();
  
  @override
  List<Object> get props => [];
}

class ShippingInitial extends ShippingState {
    @override
  List<Object> get props => [];

}

class ShippingLoadingState extends ShippingState {
  @override
  List<Object> get props => [];
}

// ignore: must_be_immutable
class ShippingLoadedState extends ShippingState {
  List<ShippingModel> shippingModel = [];

  ShippingLoadedState(this.shippingModel);

  @override
  List<Object> get props => [shippingModel];
}
class SearchLoadedState extends ShippingState {
  List<ShippingModel> shippingModel = [];

  SearchLoadedState(this.shippingModel);

  @override
  List<Object> get props => [shippingModel];
}

class ShippingErrorState extends ShippingState {
  final String error;
  
  const ShippingErrorState(this.error);

   @override
  List<Object> get props => [error];
}
class DeleteSippingState extends ShippingState{
  @override
  List<Object> get props => [];
}

class UpdateSippingState extends ShippingState{
  @override
  List<Object> get props => [];
}


