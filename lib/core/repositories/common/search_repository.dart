import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:m_hany_store/core/model/search_model.dart';

class SearchRepository{
  final searchRepo = FirebaseFirestore.instance.collection('Search');

  Future<void> createSearchByCategory({
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
       await searchRepo.add({
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
        debugPrint('failed with error creteCtegories ${e.code} ${e.message}');
      }
    }catch(e){
      throw Exception(e.toString());
    }
  }

  Future<List<SearchModel>> getShippingModel()async{
    List<SearchModel> searchModelList = [];
    try{

     var  shippingRepo = await FirebaseFirestore.instance.collection('Search').get();
      // ShippingModel shippingModel;
      for (var element in shippingRepo.docs) {
        searchModelList.add(SearchModel.formJson(element.data()));
      }

      return searchModelList;
    
    }on FirebaseException catch (e){
      if(kDebugMode){
        debugPrint('failed with error getShippingModel ${e.code} ${e.message}');
      }
      return searchModelList;
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
        debugPrint('failed with error creteCtegories ${e.code} ${e.message}');
      }
    }catch(e){
      throw Exception(e.toString());
    }
  }
 
  
}