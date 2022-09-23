import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:m_hany_store/core/routes/string_route.dart';
import 'package:m_hany_store/core/theme/colors/color_theme.dart';
import 'package:m_hany_store/core/theme/fonts/font_theme.dart';
import 'package:m_hany_store/core/theme/fonts/style.dart';

class SaleWidget extends StatefulWidget {
 
  
  const SaleWidget({Key? key}) : super(key: key);
  
  @override
  State<SaleWidget> createState() => Ssale_widgWState();
}

// ignore: camel_case_types
class Ssale_widgWState extends State<SaleWidget> {
  List salePRoducts = [];

  CollectionReference getAllProductSale = FirebaseFirestore.instance.collection('discounts product');

 @override
  void initState() {
    getProducts();
    super.initState();
  }
  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8,22,8,8),
      child: ListView.separated( 
        /* prototypeItem: const SizedBox(
          height: 12,
        ),  */

        itemCount: salePRoducts.length,
        itemBuilder: (context,index){
          return buldItemSale(context,index);
        }, 
        separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 22,)
        
      ),
    );
  }
  getProducts()async {
    QuerySnapshot responseBody  = await getAllProductSale.get();
    for(var element in responseBody.docs){
      setState(() {
        salePRoducts.add(element.data());
      });
    }
  }

  buldItemSale(context,index){
    return InkWell(
      onTap: () => Navigator.pushNamed(context, previewSalePage),
      child: Container(
        width: double.infinity,
        height: 420,
        decoration: BoxDecoration(
        color: ColorTheme.darkAppBar,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 333,
              decoration: BoxDecoration(
                borderRadius:BorderRadius.circular(8),
                //  color: Colors.black,
                image:  DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                    // 'https://wallpaperaccess.com/full/7070020.jpg',
                    '${salePRoducts[index]["image"]}'
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15,15,0,15),
              child: Text(
                '${salePRoducts[index]["name"]}',
                style: getSemiBoldStyle(color: ColorTheme.white, fontSize: 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15,0,0,5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [ 
                  Container(
                    width: 50,
                    height: 25,
                    decoration: BoxDecoration(
                      color: ColorTheme.primary,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Center(
                      child: Text(
                        '-20%',
                        style: getSemiBoldStyle(color: ColorTheme.white, fontSize: 16),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                    Text.rich(
                    TextSpan(
                      text: '${salePRoducts[index]["old price"]} LE',
                      style: TextStyle(
                        decoration: TextDecoration.combine(
                          [
                            TextDecoration.lineThrough,
                            TextDecoration.lineThrough,
                          ],
                        ),
                        fontFamily: FontsTheme.fontFamily,
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Text(
                    '${salePRoducts[index]["new price"]} LE',
                    style: getBoldStyle(color: ColorTheme.white,fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  
}