// ignore_for_file: avoid_function_literals_in_foreach_calls, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:m_hany_store/core/model/category_model.dart';

class CategoriesRpoSitory{
  final _categoriesRepo = FirebaseFirestore.instance.collection('categories');
  

  Future<void> creteCtegories({
    required int id,
    required String idDoc,
    required String name,
    required String image,
    required String type,
    required String createdAt,
    required String updatedAt,
  }) async { 
    try {
      await _categoriesRepo.add({
        "id": id,
        "id_doc":idDoc,
        "name": name,
        "image": image,
        "type": type,
        "craeted_at": createdAt,
        "updated_at": updatedAt,
      });
    } on FirebaseException catch (e){
      if(kDebugMode){
        print('failed with error creteCtegories ${e.code} ${e.message}');
      }
    } catch(e) {
      throw Exception(e.toString());
    }
  }
  /* addEmp(CategoriesModel categories) {
    categoriesRepo.add(categories.toJson());
  }

  Future<List<CategoriesModel>>  getAllCategories()async{
    var categories = await categoriesRepo.get();
    var cat = categories.docs.map((e) => CategoriesModel.fromJson(e.data())).toList();
    return cat;
  }

  Future<List<CategoriesModel>>  getCategoriesShipping()async{
    var categories = await categoriesRepo.where('type',isEqualTo: 'shipping').get();
    var cat = categories.docs.map((e) => CategoriesModel.fromJson(e.data())).toList();
    return cat;
  } */
  Future<List<CategoriesModel>> getCategoriesModel() async{
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

  Future<void> deleteSearchByCategory({
    required idDoc,
  })async{
    try{
      var  shippingRepo =  FirebaseFirestore.instance.collection('Search').doc(idDoc);
      shippingRepo.delete();
    }on FirebaseException catch (e){
      if(kDebugMode){
        print('failed with error creteCtegories ${e.code} ${e.message}');
      }
    }catch(e){
      throw Exception(e.toString());
    }
  }
}