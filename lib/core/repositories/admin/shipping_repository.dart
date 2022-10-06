// ignore_for_file: avoid_function_literals_in_foreach_calls, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:m_hany_store/core/model/category_model.dart';
import 'package:m_hany_store/core/model/shipping_model.dart';

class ShippingRepository{
  CategoriesModel? categoriesModel;
  
  final categoriesRepo = FirebaseFirestore.instance.collection('categories');

  Future<void> createShippingByCategory({
    required int id,
    required String idDoc,
    required String name,
    required String image,
    required String region,
    required double price,
    required String type,
    required String createdAt,
    required String updatedAt,
  })async{
    try{
       await categoriesRepo.add({
        "id": id,
        "id_doc":idDoc,
        "name": name,
        "image": image,
        "region": region,
        "price": price,
        "type": type,
        "craeted_at": createdAt,
        "updated_at": updatedAt,
      });
    } on FirebaseException catch (e){
      if(kDebugMode){
        print('failed with error creteCtegories ${e.code} ${e.message}');
      }
    }catch(e){
      throw Exception(e.toString());
    }
  }

  Future<List<ShippingModel>> getShippingModel({ required String idDoc,required String type})async{
    List<ShippingModel> shippingModelList = [];
    try{

     var  shippingRepo = await FirebaseFirestore.instance.collection('categories').doc(idDoc).collection(type).get();
      // ShippingModel shippingModel;
      for (var element in shippingRepo.docs) {
        shippingModelList.add(ShippingModel.formJson(element.data()));
      }

      return shippingModelList;
    
    }on FirebaseException catch (e){
      if(kDebugMode){
        print('failed with error getShippingModel ${e.code} ${e.message}');
      }
      return shippingModelList;
    } catch(e) {
      throw Exception(e.toString());
    }
  }
  /* Future<List<CategoriesModel>> getShippingByCategory(int categoryId) async{
    List<CategoriesModel> categoriesModelLsit = [];
    CategoriesModel? categoriesModel;
    try{
    
      final categoriesRepo = await FirebaseFirestore.instance.collection('categories').doc(categoriesModel!.idDoc).get();

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
  } */
  Future<void> deleteShippingByCategory({
     required String collectionIdDoc,
     required  idDoc,
     required String type,
     required String refFromURL,
  })async{
    try{
      var  shippingRepo =  FirebaseFirestore.instance.collection('categories').doc(collectionIdDoc).collection(type).doc(idDoc);
      shippingRepo.delete();
      await FirebaseStorage.instance.refFromURL(refFromURL).delete();
    }on FirebaseException catch (e){
      if(kDebugMode){
        print('failed with error creteCtegories ${e.code} ${e.message}');
      }
    }catch(e){
      throw Exception(e.toString());
    }
  }

  Future<void> updateShippingByCategory({
    required String collectionIdDoc,
    required String idDoc,
    required String name,
    required String image,
    required String region,
    required double price,
    required String type,
    required String updatedAt,
  })async{
    var  shippingRepo =  FirebaseFirestore.instance.collection('categories').doc(collectionIdDoc).collection(type).doc(idDoc);
    try{
       await shippingRepo.update({
        "id_doc":idDoc,
        "name": name,
        "image": image,
        "region": region,
        "price": price,
        "type": type,
        "updated_at": updatedAt,
      });
    } on FirebaseException catch (e){
      if(kDebugMode){
        print('failed with error creteCtegories ${e.code} ${e.message}');
      }
    }catch(e){
      throw Exception(e.toString());
    }
  }
}