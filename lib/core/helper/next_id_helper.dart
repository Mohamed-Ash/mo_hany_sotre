import 'package:cloud_firestore/cloud_firestore.dart';

class NextIdHelper{

  static Future<String> getNextId( String collectionName)async{
    final fireStore = await FirebaseFirestore.instance.collection(collectionName).doc().get();
    return fireStore.id;
  }
}