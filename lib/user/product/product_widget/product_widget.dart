// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:m_hany_store/core/routes/string_route.dart';
import 'package:m_hany_store/core/theme/colors/color_theme.dart';
import 'package:m_hany_store/core/theme/fonts/style.dart';

// ignore: must_be_immutable
class ProductWidget extends StatefulWidget {
  const ProductWidget({Key? key}) : super(key: key);

  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  List salePRoducts = [];

  CollectionReference getAllProduct = FirebaseFirestore.instance.collection('all broducts');
  @override
  void initState() {
    getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
      child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 2/3,
              crossAxisCount: 2,
              crossAxisSpacing: 1,
              mainAxisSpacing: 1,
            ),
            itemBuilder: (context,index) => getAllproducts(context,index),
            itemCount: salePRoducts.length,
          ),
      /* child: ListView.builder(
        itemBuilder:(contextn,index) =>getAllproducts(context, index),
        itemCount: salePRoducts.length, 
      ), */
    );
  }

  getProducts()async {
    QuerySnapshot responseBody  = await getAllProduct.get();
    for(var element in responseBody.docs){
      setState(() {
        salePRoducts.add(element.data());
      });
    }
  }

   getAllproducts(context,index){
    return InkWell(
      onTap: ()=> Navigator.pushNamed(context, previewProductPage,),
      child: Stack(
        children: [
          Container(
            width: 160,
            height: 280,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: ColorTheme.hintText
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 160,
                height: 180,
                decoration: BoxDecoration(
                  borderRadius:BorderRadius.circular(8),
                  //  color: Colors.black,
                  image:   DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                      "${salePRoducts[index]['image']}"
                      // "https://wallpaperaccess.com/full/7070020.jpg"
                    ),
                  ),
                ),
                // child: Text( "${products[index]['info']}"),
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                '${salePRoducts[index]['name']}',
                style: getBoldStyle(color: ColorTheme.white,fontSize: 18),
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                'Price ${salePRoducts[index]['price']} LE',
                style: getBoldStyle(color: ColorTheme.white,fontSize: 18),
              ),
            ],
          ),
        ],
      ),
    );
  }

  fixBixiles(BuildContext context){
    if(MediaQuery.of(context).size.width > 30.0 && MediaQuery.of(context).size.width < 100.0 ) {
      return 130.0;
    }else if (MediaQuery.of(context).size.width < 100.0 && MediaQuery.of(context).size.width > 200.0 ){
      return 150.0;
    }else if (MediaQuery.of(context).size.width < 200.0 && MediaQuery.of(context).size.width > 300.0 ){
      return 160.0;
    }else{
      return 175.0;
    }
  }  
}
