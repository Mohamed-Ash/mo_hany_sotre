// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:m_hany_store/admin/admin_interface.dart';
import 'package:m_hany_store/admin/categories/categories_widget/edit_item_categories_widget.dart';

// ignore: must_be_immutable
class EditItemCategoriesPage extends AdminInterface{
  String? id;
  DocumentSnapshot? categories;

  var getAllProductSale = FirebaseFirestore.instance.collection('categories').doc();
  
  EditItemCategoriesPage({super.key,required this.id,required this.categories});
  
  @override
  Widget buildBody(BuildContext context) {
    return   StreamBuilder(
      stream: getAllProductSale.snapshots(),
      builder: (context,  snapshot) {
        // List<DocumentSnapshot> docs = snapshot.data!.docs;
          print(categories!.reference.id,);
        if(snapshot.hasData) {
          return EditItemCategoriesWidget(id: id, categories: categories);
        } else if(snapshot.connectionState == ConnectionState.waiting){
          return const Center(child:  CircularProgressIndicator(),);
        } else {
          return const Text('error 404');
        }
      },
    );
  }


}