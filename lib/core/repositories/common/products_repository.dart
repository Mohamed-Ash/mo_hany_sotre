// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:m_hany_store/core/model/product_model.dart';

class ProductReposiory{
  List<ProductModel> products = [];

  Future<List<ProductModel>?> getAllProducts() async {
    final productsCollection = await FirebaseFirestore.instance.collection('products').get();
    try {
      return productsCollection.docs.fold<List<ProductModel>>(
        <ProductModel>[],
        (previousValue, element) => previousValue..add(ProductModel.fromJson(element.data()))
      );
    } catch (e) {
      print('[Products Repository] [Error] [$e]');
      return null;
    }
  }
}