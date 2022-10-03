import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:m_hany_store/admin/admin_interface.dart';
import 'package:m_hany_store/admin/shipping/shipping_widget/edit_item_shipping_widget.dart';

// ignore: must_be_immutable
class EditItemShippingPage extends AdminInterface{
  String? id;
  DocumentSnapshot? shipping;
  CollectionReference getAllProductSale = FirebaseFirestore.instance.collection('categories').doc('5144z0GZ5BA4m8riyX4D').collection('shipping');
  EditItemShippingPage({super.key,this.id,this.shipping});

  @override
  Widget buildBody(BuildContext context) {
    return StreamBuilder(
      stream: getAllProductSale.snapshots(),
      builder: (context,  snapshot) {
        // List<DocumentSnapshot> docs = snapshot.data!.docs;
        if(snapshot.hasData) {
          return EditItemShippingWidget(shipping: shipping,id: id,);
        } else if(snapshot.connectionState == ConnectionState.waiting){
          return const Center(child:  CircularProgressIndicator(),);
        } else {
          return const Text('error 404');
        }
      },
    );
  }
} 