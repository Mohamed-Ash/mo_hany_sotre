// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:m_hany_store/core/theme/colors/color_theme.dart';
import 'package:m_hany_store/core/theme/fonts/style.dart';

class ShippingWidget extends StatefulWidget {
  const ShippingWidget({Key? key}) : super(key: key);

  @override
  State<ShippingWidget> createState() => _ShippingWidgetState();
}
 
class _ShippingWidgetState extends State<ShippingWidget> {

  List salePRoducts = [];

  final Query getAllProductSale = FirebaseFirestore.instance.collection('categories').where("type", isEqualTo: 'shipping');
  // final Query getAllProductSale = FirebaseFirestore.instance.collection('categories').where("title", isEqualTo: 'steam');
    
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
                      categories: snapshot.data!.docs[index],
                      context: context, 
                      // index: index, 
                      id: snapshot.data!.docs[index].id
                    ), 
                    separatorBuilder: (context ,index)=> const Divider(
                      color: ColorTheme.porder,
                      thickness: 1,
                    ),
                    itemCount: salePRoducts.length,
                  ),
                );
              } else if(snapshot.connectionState == ConnectionState.waiting){
                return const Center(child:  CircularProgressIndicator(),);
              } else {
                return const Text('error 404');
              }
            },
          ),
          // const Spacer(),
          /* const SizedBox(height: 22,),
          InkWell(
            onTap: () => Navigator.pushNamed(context, addItemCategoriesPage),
            child: FormFeilds.buttonFormField(
              title: 'Add  new Categories',
              dPadding: false,
              heightButton: 40,
              colorButton: ColorTheme.primary
            ),
          ), */
        ],
      ),
    );
  }

 Widget buildItemProduct({
   required BuildContext context,
    // required int index,
    required String id,
    required DocumentSnapshot categories,
 }){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
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
                image: NetworkImage('${categories['images']}')
              ),
            ),
          ),
          
          // const Spacer(),
          Flexible(
            // flex: 3,
            child: Text(
              '${categories['name']}',
              style: getSemiBoldStyle(color: ColorTheme.white,fontSize: 14,),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          // const Spacer(),
          // const SizedBox(width: 12,),
          /* Row(
            children: [ 
              IconButton(
                onPressed: () =>Navigator.pushNamed(context, previewItemCategoriesPage) , 
                icon: FormFeilds.containerImage(assetImage: 'assets/images/eye.png',height: 18,width: 18),
              ),
              IconButton(
                onPressed: () => Navigator.pushNamed(context, editItemCategoriesPage),
                icon: FormFeilds.containerImage(assetImage: 'assets/images/edit.png',height: 18,width: 18),
              ),
              IconButton(
                onPressed: () {}, 
                icon: FormFeilds.containerImage(assetImage: 'assets/images/delete.png',height: 18,width: 18),
              ),
            ],
          ), */
        ],
      ),
    );
  }


  Future<void> getCategories() async {
    QuerySnapshot responseBody  = await getAllProductSale.get();
    for(var element in responseBody.docs){
      setState(() {
        salePRoducts.add(element.data());
      });
       print(element.data());
    }
  }
  
}