/* import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  CollectionReference getAllProducts = FirebaseFirestore.instance.collection('all broducts');
  List<dynamic> products = [];

  ProductCubit() : super(ProductInitial());

  void getProducts() async{
    try{
      emit(ProductLoadingState());
      QuerySnapshot responseBody = await getAllProducts.get();
      for (var element in responseBody.docs) {
        products.add(element.data());
        emit(ProductLoadedState(products));
        // print(products);
      }
      print('=====================');
    }catch(e){
      print('error $e');
    }
  }
}
 */