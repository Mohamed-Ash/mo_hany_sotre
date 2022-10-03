import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:m_hany_store/admin/admin_interface.dart';
import 'package:m_hany_store/core/theme/fonts/style.dart';

import '../../../core/theme/colors/color_theme.dart';

// ignore: must_be_immutable
class PreviewItemShippingPage extends AdminInterface{
  final String id;
  final DocumentSnapshot shipping;
  CollectionReference getAllProductSale = FirebaseFirestore.instance.collection('categories').doc('5144z0GZ5BA4m8riyX4D').collection('shipping');
  
  PreviewItemShippingPage(this.id, this.shipping, {super.key});

  @override
  Widget buildBody(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 33,
            ),
            IconButton(
              onPressed: () => Navigator.pop(context), 
              icon: const Icon(Icons.arrow_back_ios,color: Colors.white),
            ),
            StreamBuilder(
              stream: getAllProductSale.snapshots(),
              builder: (context,AsyncSnapshot<QuerySnapshot>  snapshot){
                // List<DocumentSnapshot> docs = snapshot.data!.docs;
                if(snapshot.hasData) {
                  return getData(context);
                } else if(snapshot.connectionState == ConnectionState.waiting){
                  return const Center(child:  CircularProgressIndicator(),);
                } else {
                  return const Text('error 404');
                }
              },
            ),
            const Divider(
              color: ColorTheme.porder,
              thickness: 1,
            ),
          ],
        ),
      ),
    );
  }

  Widget getData(BuildContext context){
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 300,
          decoration:  BoxDecoration(
            // color: Colors.white,
            // borderRadius: BorderRadius.circular(12),
            image: DecorationImage(
              fit: BoxFit.contain,
              image: NetworkImage(shipping['image'])
            ),
          ),
        ),
        const SizedBox(
          height: 22  ,
        ),
        const Divider(
          color: ColorTheme.porder,
          thickness: 1,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(18,0,18,0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Name',
                style: getRegulerStyle(color: ColorTheme.hintText,fontSize: 15),  
              ),
              Text(
                '${shipping['name']}',
                style: getSemiBoldStyle(color: ColorTheme.wight,),  
              ),
            ],
          ),
        ),  
        const Divider(
          color: ColorTheme.porder,
          thickness: 1,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(18,0,18,0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Creatged at ',
                style: getRegulerStyle(color: ColorTheme.hintText,fontSize: 15),  
              ),
              Text(
                '${shipping['craetedAt']}',
                style: getSemiBoldStyle(color: ColorTheme.wight,),  
              ),
            ],
          ),
        ),  
        const Divider(
          color: ColorTheme.porder,
          thickness: 1,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(18,0,18,0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Updated At ',
                style: getRegulerStyle(color: ColorTheme.hintText,fontSize: 15),  
              ),
              Text(
                '${shipping['updatedAt']}',
                style: getSemiBoldStyle(color: ColorTheme.wight,),  
              ),
            ],
          ),
        ),  
        const Divider(
          color: ColorTheme.porder,
          thickness: 1,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(18,0,18,0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Rrgion ',
                style: getRegulerStyle(color: ColorTheme.hintText,fontSize: 15),  
              ),
              Text(
                '${shipping['region']}',
                style: getSemiBoldStyle(color: ColorTheme.wight,),  
              ),
            ],
          ),
        ),  
      ],
    );
  }
}