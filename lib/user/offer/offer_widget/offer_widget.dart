import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:m_hany_store/core/bloc/bloc/api_data_bloc.dart';
import 'package:m_hany_store/core/bloc/criteria/where_criteria.dart';
import 'package:m_hany_store/core/form_fields/button_form_feilds.dart';
import 'package:m_hany_store/core/model/item_model.dart';
import 'package:m_hany_store/core/theme/colors/color_theme.dart';
import 'package:m_hany_store/core/theme/fonts/style.dart';
import 'package:m_hany_store/user/offer/offer_widget/offer_item_widget.dart';

// ignore: must_be_immutable
class OfferWidget extends StatefulWidget {
 late ApiDataBloc<ItemModel> itemBloc;
 ItemModel? itemModel;
  
  OfferWidget({Key? key,required this.itemBloc}) : super(key: key);
  
  @override
  State<OfferWidget> createState() => Ssale_widgWState();
}


// ignore: camel_case_types
class Ssale_widgWState extends State<OfferWidget> {

@override
void initState() {
  super.initState();
  widget.itemBloc =  ApiDataBloc()..add( IndexDataEvent(
    where: WhereCriteria(field: 'is_offer', isEqualTo: true)
  ));
}

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8,22,8,8),
      child: BlocBuilder(
        bloc: widget.itemBloc,
        builder: (context, state) {
          if (state is DataLoadedState) {
          if(state.data.isEmpty){
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FormFeilds.containerImage(assetImage: 'assets/images/waiting.png',height: 200,width: 200),
                  const SizedBox(
                    height: 50,
                  ),
                  Text(
                    'Wait for a new offers to be uploaded',
                    style: getBoldStyle(color: ColorTheme.wight,fontSize: 14),
                  ),
                ],
              ),
            );
          }else{
             return GridView.builder(
              shrinkWrap: true ,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              mainAxisExtent:   350, 
              ), 
              itemBuilder: (BuildContext context,int index,) => OfferItemWidget(itemModel: state.data[index]),
              itemCount: state.data.length,
            );
                      
                    /*   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      mainAxisExtent: 410,
                      ), */
                      // itemBuilder: (BuildContext context,int index,) => ProductItemWidget(itemModel: state.data[index],isSelected: isSelected),
                      // itemCount: state.data.length,
            /* return ListView.separated( 
              itemCount: state.data.length,
              itemBuilder: (context,index){
                return OfferItemWidget(itemModel: state.data[index]);
              }, 
              separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 10,)
            ); */
          
          }
          }else if(state is DataLoadingState){
            return  const Center(child: CircularProgressIndicator(color: ColorTheme.primary),);
          }else{
            return Text('error 404',style: getSemiBoldStyle(color: ColorTheme.wight,fontSize: 14,),);
          }
        }
      ),
    );
  }
/*   getProducts()async {
    QuerySnapshot responseBody  = await getAllProductSale.get();
    for(var element in responseBody.docs){
      setState(() {
        salePRoducts.add(element.data());
      });
    }
  }
 */
}