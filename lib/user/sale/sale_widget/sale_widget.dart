import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:m_hany_store/core/bloc/bloc/api_data_bloc.dart';
import 'package:m_hany_store/core/bloc/criteria/where_criteria.dart';
import 'package:m_hany_store/core/model/item_model.dart';
import 'package:m_hany_store/core/routes/string_route.dart';
import 'package:m_hany_store/core/theme/colors/color_theme.dart';
import 'package:m_hany_store/core/theme/fonts/font_theme.dart';
import 'package:m_hany_store/core/theme/fonts/style.dart';

// ignore: must_be_immutable
class SaleWidget extends StatefulWidget {
 late ApiDataBloc<ItemModel> itemBloc;
 ItemModel? itemModel;
  
  SaleWidget({Key? key,required this.itemBloc}) : super(key: key);
  
  @override
  State<SaleWidget> createState() => Ssale_widgWState();
}

// ignore: camel_case_types
class Ssale_widgWState extends State<SaleWidget> {

 @override
  void initState() {
    super.initState();
   widget.itemBloc = ApiDataBloc<ItemModel>()..add(
      IndexDataEvent(
        where:  WhereCriteria(field: 'test' ,isEqualTo: 'true'),));
  }
  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8,22,8,8),
      child: BlocBuilder(
        bloc: widget.itemBloc,
        builder: (context, state) {
          if (state is DataLoadedState) {
            return ListView.separated( 
              itemCount: state.data.length,
              itemBuilder: (context,index){
                return buldItemSale(
                  context: context,
                  itemModel: state.data[index]
                );
              }, 
              separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 22,)
            );
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
  buldItemSale({
    required BuildContext context,
    required ItemModel itemModel,
  }){
    return InkWell(
      onTap: () => Navigator.pushNamed(context, showSalePage),
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
                    itemModel.image
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15,15,0,15),
              child: Text(
                itemModel.name,
                style: getSemiBoldStyle(color: ColorTheme.wight, fontSize: 16),
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
                        style: getSemiBoldStyle(color: ColorTheme.wight, fontSize: 16),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                    Text.rich(
                    TextSpan(
                      text: '${itemModel.price} old price LE',
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
                    '${itemModel.price} new price LE',
                    style: getBoldStyle(color: ColorTheme.wight,fontSize: 16),
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