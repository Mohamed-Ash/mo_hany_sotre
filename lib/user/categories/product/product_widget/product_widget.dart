import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:m_hany_store/core/bloc/shipping_bloc/shipping_bloc.dart';
import 'package:m_hany_store/core/model/category_model.dart';
import 'package:m_hany_store/core/model/shipping_model.dart';
import 'package:m_hany_store/core/theme/colors/color_theme.dart';
import 'package:m_hany_store/core/theme/fonts/style.dart';
import 'package:m_hany_store/user/categories/product/product_page/preview_product_page.dart';

// ignore: must_be_immutable
class ProductWidget extends StatefulWidget {
  final CategoriesModel categoriesModel;
  const ProductWidget({Key? key,required this.categoriesModel}) : super(key: key);

  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  List salePRoducts = [];

  /* CollectionReference getAllProduct = FirebaseFirestore.instance
    .collection('categories')
    .doc('CKPdS9g0VfCDCr2XUbfN')
    .collection('red dead'); */
    
  @override
  void initState() {
    BlocProvider.of<ShippingBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
      child: BlocBuilder<ShippingBloc,ShippingState>(
        builder:(context, state) {
          if(state is ShippingLoadedState){
            return GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 2/3,
                crossAxisCount: 2,
                crossAxisSpacing: 1,
                mainAxisSpacing: 1,
              ),
              itemBuilder: (context,index) => getAllproducts(
                context: context,
                categoriesModel: widget.categoriesModel, 
                shipping: state.shippingModel[index],
              ),
              itemCount: state.shippingModel.length,
            );
          }else if(state is ShippingLoadingState){
            return const Center(child: CircularProgressIndicator(),);
          }else if(state is ShippingErrorState){
            return Text(state.error,style: getSemiBoldStyle(color: ColorTheme.wight,fontSize: 14,));
          }else{
            return Center(child: Text('error 404',style: getSemiBoldStyle(color: ColorTheme.wight,fontSize: 14,),));  
          }
        }
      ),
      /* child: ListView.builder(
        itemBuilder:(contextn,index) =>getAllproducts(context, index),
        itemCount: salePRoducts.length, 
      ), */
    );
  }

 /*  getProducts()async {
    QuerySnapshot responseBody  = await getAllProduct.get();
    for(var element in responseBody.docs){
      setState(() {
        salePRoducts.add(element.data());
      });
    }
  }
 */ 
   getAllproducts({
    required BuildContext context,
    required CategoriesModel categoriesModel,
    required ShippingModel shipping,
   }){
    return InkWell(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context){
              return PreviewProductPage(shippingModel: shipping,);
            }
          ),
        );
      },
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
                      shipping.image
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
                shipping.name,
                style: getBoldStyle(color: ColorTheme.wight,fontSize: 18),
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                'Price ${shipping.price} LE',
                style: getBoldStyle(color: ColorTheme.wight,fontSize: 18),
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
