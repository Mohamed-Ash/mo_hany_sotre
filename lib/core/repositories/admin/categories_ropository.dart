/* 
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
      debugPrint('failed with error creteCtegories ${e.code} ${e.message}');
    } catch(e) {
      throw Exception(e.toString());
    }
  }

  Future<List<CategoryModel>> getCategoriesModel() async{
    List<CategoryModel> categoriesModelLsit = [];
    try{
    
      final categoriesRepo = await FirebaseFirestore.instance.collection('categories').get();

      for (var element in categoriesRepo.docs) {
        
        categoriesModelLsit.add(CategoryModel.fromJson(element.data()));
      }
      debugPrint('=================== ');
      return categoriesModelLsit;
    }on FirebaseException catch (e){
      debugPrint('failed with error getCategoriesModel ${e.code} ${e.message}');
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
      debugPrint('failed with error creteCtegories ${e.code} ${e.message}');
    }catch(e){
      throw Exception(e.toString());
    }
  }
} */