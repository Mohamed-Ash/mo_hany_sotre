// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:m_hany_store/core/theme/colors/color_theme.dart';
import 'package:m_hany_store/core/theme/fonts/style.dart';
import 'package:m_hany_store/user/categories/shipping/user_shipping_page/preview_user_shipping_page.dart';

class UserShippingWidget extends StatefulWidget {
  const UserShippingWidget({Key? key}) : super(key: key);

  @override
  State<UserShippingWidget> createState() => _UserShippingWidgetState();
}

class _UserShippingWidgetState extends State<UserShippingWidget> {
 List salePRoducts = [];

  // var ref  = FirebaseFirestore.instance.collection('categories').doc().id; 
  var getAllProductSale = FirebaseFirestore.instance.collection('categories').doc('5144z0GZ5BA4m8riyX4D').collection('shipping').where('type',isEqualTo: 'shipping');
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
                return GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 2 / 3,
                    crossAxisSpacing: 1,
                    mainAxisSpacing: 1,
                  ),
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) => buildItemProduct(
                    context: context, 
                    id: snapshot.data!.docs[index].id, 
                    shipping: snapshot.data!.docs[index],
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
          const SizedBox(height: 22,),
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
    return  InkWell(
      onTap: ()async{
         Navigator.push(
          context, MaterialPageRoute(
            builder: (context){
              return PreviewUserShippingPage(shipping: shipping, id: id,);
            }
          ),
        );
      },
      child: Center(
        child: Stack(
          children: [
            Container(
              width: 160,
              height: 250,
              decoration: BoxDecoration(
                color: ColorTheme.authTitle,
                borderRadius: BorderRadius.circular(8),
              ),
              // alignment: Alignment.topCenter,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Container(
                          width: 160,
                          height: 180,
                        decoration: BoxDecoration(
                          borderRadius:BorderRadius.circular(8),
                          color: ColorTheme.wight,
                          image:  DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(
                              // '${widg1et.productModel.imagePath}'
                              '${shipping['image']}'
                              // 'https://media.istockphoto.com/photos/image-of-brunette-in-fake-fur-coat-with-hood-picture-id535313567?k=20&m=535313567&s=612x612&w=0&h=xU51bRMrO0IV_uhBeys4orEUjktUbwzJVszpNgikKOY='
                            ),
                          ),
                        ),
                      ),
                    /*  Container(
                        height: 20,
                        width: double.infinity,
                        decoration: BoxDecoration(
                        color: Colors.black38,
                        borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(
                            'gat',
                            style: getBoldStyle(color: ColorTheme.wight),
                          ),
                        ),
                      ), */
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 3, 0, 0),
                    child: Text(
                      'turky',
                      style: getSemiBoldStyle(color: ColorTheme.wight),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 3, 0, 0),
                    child: Text(
                      '120 LE',
                        style: getRegulerStyle(color: ColorTheme.wight),
                    ),
                  ),
                ],
              ),
            ),
                        /*  Positioned(
                            height: 38,
                            right: 10,
                            child: IconButton(
                              icon: const Icon(
                                Icons.abc
                              ),
                              color: Colors.red,
                              onPressed: ()async {
                              },
                            ),
                          ), */
                        ],
                      ),
                    ),
                  );
    /*  Row(
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
          ), */
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