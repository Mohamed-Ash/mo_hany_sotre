// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:m_hany_store/admin/shipping/shipping_page/edit_item_shipping_page.dart';
import 'package:m_hany_store/admin/shipping/shipping_page/preview_item_shipping_page.dart';
import 'package:m_hany_store/core/form_fields/button_form_feilds.dart';
import 'package:m_hany_store/core/routes/string_route.dart';
import 'package:m_hany_store/core/theme/colors/color_theme.dart';
import 'package:m_hany_store/core/theme/fonts/style.dart';

class ShippingWidget extends StatefulWidget {
  const ShippingWidget({Key? key}) : super(key: key);

  @override
  State<ShippingWidget> createState() => _ShippingWidgetState();
}
 
class _ShippingWidgetState extends State<ShippingWidget> {

  List salePRoducts = [];

  // var ref  = FirebaseFirestore.instance.collection('categories').doc().id; 
  CollectionReference getAllProductSale = FirebaseFirestore.instance.collection('categories').doc('5144z0GZ5BA4m8riyX4D').collection('shipping');
  // final Query getAllProductSale = FirebaseFirestore.instance.collection('categories').where("titlre", isEqualTo: 'steam');
    
  @override
  void initState() {
    getCategories();
    super.initState();
   
  }
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 33, 12, 33),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 22,),
          StreamBuilder(
            stream: getAllProductSale.snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot>  snapshot) {
              if(snapshot.hasData) {
                return Expanded(
                  child: ListView.separated(
                    physics: const ScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context ,index)=> buildItemProduct(
                      shipping: snapshot.data!.docs[index],
                      context: context, 
                      // index: index, 
                      id: snapshot.data!.docs[index].id
                    ), 
                    separatorBuilder: (context ,index)=> const Divider(
                      color: ColorTheme.porder,
                      thickness: 1,
                    ),
                    itemCount: snapshot.data!.docs.length,
                  ),
                );
              } else if(snapshot.connectionState == ConnectionState.waiting){
                return const Center(child:  CircularProgressIndicator(),);
              } else if(snapshot.connectionState == ConnectionState.none){
                print('succsess');
                return Center(child: Text('You do not publish eny shipping',style: getSemiBoldStyle(color: ColorTheme.wight,fontSize: 14,),));
              }else {
                return const Text('error 404');
              }
            },
          ),
          // const Spacer(),
          const SizedBox(height: 22,),
          InkWell(
            onTap: () => Navigator.pushNamed(context, addItemShippingPage),
            child: FormFeilds.buttonFormField(
              title: 'Add new shipping',
              dPadding: false,
              heightButton: 40,
              colorButton: ColorTheme.primary
            ),
          ),
        ],
      ),
    );
  }

 Widget buildItemProduct({
    required BuildContext context,
    // required int index,
    required String id,
    required DocumentSnapshot shipping,
  }){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 75,
          height: 75,
          decoration: BoxDecoration(
            // color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            image:  DecorationImage(
              fit: BoxFit.contain,
                image: NetworkImage(shipping['image'])
              ),
            ),
          ),
          
          const SizedBox(width: 18,),
          Flexible(
            // flex: 3,
            child: Text(
              shipping['name'],
              style: getSemiBoldStyle(color: ColorTheme.wight,fontSize: 14,),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const Spacer(),
          // const SizedBox(width: 12,),
          Row(
            children: [ 
              IconButton(
                onPressed: () => Navigator.push(
                  context, MaterialPageRoute(
                    builder: (context){
                      return PreviewItemShippingPage(id, shipping);
                    }
                  ),
                ),
                icon: FormFeilds.containerImage(assetImage: 'assets/images/eye.png',height: 18,width: 18),
              ),
              IconButton(
                // onPressed: () => Navigator.pushNamed(context, editItemCategoriesPage,arguments: id),
                onPressed: () => Navigator.push(
                  context, MaterialPageRoute(
                    builder: (context){
                      return  EditItemShippingPage(shipping: shipping,id: id,);
                    }
                  ),
                ),
                icon: FormFeilds.containerImage(assetImage: 'assets/images/edit.png',height: 18,width: 18),
              ),
              IconButton(
                onPressed: (){
                  FormFeilds.mesgDelete(
                    context, 
                    'Are you sure to delete?',
                    InkWell(
                      onTap: () async {
                        await FirebaseStorage.instance.refFromURL(shipping['image']).delete();
                        await getAllProductSale.doc(id).delete();
                        // ignore: use_build_context_synchronously
                        Navigator.of(context).pop();
                      },
                      child: FormFeilds.buttonFormField(title: 'delete',colorButton: ColorTheme.primary),
                    ),
                  );
                }, 
                icon: FormFeilds.containerImage(assetImage: 'assets/images/delete.png',height: 18,width: 18),
              ),
            ],
          ),
      ],
    );
  }


  Future<void> getCategories() async {
 


    QuerySnapshot responseBody  = await getAllProductSale.get();
    for(var element in responseBody.docs){
      setState(() {
        salePRoducts.add(element.data());
      });
        /* salePRoducts.add(element.id);
        print('====================');
        print(salePRoducts); */
    }
  }

  
}