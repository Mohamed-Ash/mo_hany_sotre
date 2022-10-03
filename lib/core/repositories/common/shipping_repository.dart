// ignore_for_file: avoid_function_literals_in_foreach_calls, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:m_hany_store/core/model/category_model.dart';

class ShippingRepository{
  final shippingCollection = FirebaseFirestore.instance.collection('shipping');
  
  
  Future<List<CategoriesModel>> getShippingByCategory(int categoryId) async{
    List<CategoriesModel> categoriesModelLsit = [];
    try{
    
      final categoriesRepo = await FirebaseFirestore.instance.collection('categories').get();

      for (var element in categoriesRepo.docs) {
        categoriesModelLsit.add(CategoriesModel.fromJson(element.data()));
      }
      print('=================== ');
      return categoriesModelLsit;
    }on FirebaseException catch (e){
      if(kDebugMode){
        print('failed with error getCategoriesModel ${e.code} ${e.message}');
      }
      return categoriesModelLsit ;
    } catch(e) {
      throw Exception(e.toString());
    }
  }
}