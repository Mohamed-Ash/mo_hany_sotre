import 'package:cloud_firestore/cloud_firestore.dart';

class NextIdHelper{

  static Future<int> getNextId( String collectionName)async{
    final fireStore = await FirebaseFirestore.instance.collection(collectionName).get();
    return fireStore.docs.length + 1;
  }
}