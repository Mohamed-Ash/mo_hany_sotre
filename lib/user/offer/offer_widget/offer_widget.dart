import 'package:date_count_down/date_count_down.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:m_hany_store/core/bloc/bloc/api_data_bloc.dart';
import 'package:m_hany_store/core/bloc/criteria/where_criteria.dart';
import 'package:m_hany_store/core/form_fields/button_form_feilds.dart';
import 'package:m_hany_store/core/model/item_model.dart';
import 'package:m_hany_store/core/routes/string_route.dart';
import 'package:m_hany_store/core/theme/colors/color_theme.dart';
import 'package:m_hany_store/core/theme/fonts/font_theme.dart';
import 'package:m_hany_store/core/theme/fonts/style.dart';

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
            return ListView.separated( 
              itemCount: state.data.length,
              itemBuilder: (context,index){
                return buldItemSale(
                  context: context,
                  itemModel: state.data[index]
                );
              }, 
              separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 10,)
            );
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
  buldItemSale({
    required BuildContext context,
    required ItemModel itemModel,
  }){
    Object fiterOperatorr ;

    if (itemModel.price == itemModel.offerPrice){
      fiterOperatorr = 100 ;
    } else if(itemModel.percent! < 10){
      fiterOperatorr = itemModel.percent.toString().substring(0,1 );
    }else{
      fiterOperatorr = itemModel.percent.toString().substring(0,2);
    }
    // var fiterPercent = itemModel.price == itemModel.offerPrice ? 100 : itemModel.percent.toString().substring(0,2);
    var fiterOfferPrice = itemModel.price == itemModel.offerPrice ? 'free' : "${itemModel.offerPrice} LE";
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 22, 12, 22),
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, previewSalePage,arguments: itemModel),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
          color: ColorTheme.darkAppBar,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            /*   Container(
                width: double.infinity,
                height: 333,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                  image:  DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                      itemModel.image),
                  ),
                ),
              ), */
              Container(
                decoration:const BoxDecoration(
                  borderRadius:  BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                ),
                width: double.infinity,
                height: 333,
                child: PhysicalModel(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  color: Colors.black,
                  shape: BoxShape.rectangle,  
                  borderRadius: BorderRadius.circular(8),
                  child: itemModel.image.isNotEmpty? FadeInImage.assetNetwork(
                    placeholder: 'assets/icons/lloading.gif',
                    image: itemModel.image,
                    fit: BoxFit.fill,
                    placeholderFit: BoxFit.contain,
                  ) : Image.asset('assets/images/no_image_available.jpg'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0,15,0,5),
                child: Text(
                  itemModel.name,
                  style: getSemiBoldStyle(color: ColorTheme.wight, fontSize: 16),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0,5,0,5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 80,
                      height: 25,
                      decoration: BoxDecoration(
                        color: ColorTheme.primary,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Center(
                        child: Text(
                          '- $fiterOperatorr %',
                          style: getSemiBoldStyle(color: ColorTheme.wight, fontSize: 16),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                      Text.rich(
                      TextSpan(
                        text: '${itemModel.price} LE',
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
                      '$fiterOfferPrice ',
                      style: getBoldStyle(color: ColorTheme.wight,fontSize: 16),
                    ),
                  ],
                ),
              ),
              /* Padding(
                padding: const EdgeInsets.fromLTRB(0,5,0,20),
                child: Text(
                  'sale ends 11/1/2022 at 5:30 pm',
                  style: getSemiBoldStyle(color: ColorTheme.wight, fontSize: 16),
                ),
              ), */
              Padding(
                padding: const EdgeInsets.fromLTRB(0,5,0,20),
                child: CountDownText(
                  due: DateTime.parse("${itemModel.dateOffer}"),
                  finishedText: "This offer has expired",
                  showLabel: true,
                  longDateName: true,
                  daysTextLong: " days ",
                  hoursTextLong: " hours ",
                  minutesTextLong: " mins ",
                  secondsTextLong: " secs ",
                  style: getBoldStyle(color: ColorTheme.wight,fontSize: 14),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}