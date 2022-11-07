// ignore_for_file: unnecessary_null_comparison

import 'package:date_count_down/date_count_down.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:m_hany_store/core/bloc/bloc/api_data_bloc.dart';
import 'package:m_hany_store/core/form_fields/button_form_feilds.dart';
import 'package:m_hany_store/core/model/category_model.dart';
import 'package:m_hany_store/core/model/item_model.dart';
import 'package:m_hany_store/core/routes/string_route.dart';
import 'package:m_hany_store/core/theme/colors/color_theme.dart';
import 'package:m_hany_store/core/theme/fonts/style.dart';

class ShowOffersWidget extends StatefulWidget {
  final ApiDataBloc<ItemModel> itemModel;
  final ApiDataBloc<CategoryModel> categoriesModel;

  const ShowOffersWidget({Key? key,required this.itemModel, required this.categoriesModel}) : super(key: key);

  @override
  State<ShowOffersWidget> createState() => _ShowOffersWidgetState();
}

class _ShowOffersWidgetState extends State<ShowOffersWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: BlocBuilder(
        bloc: widget.itemModel,
        builder: (context, state) {
          if (state is DataLoadedState) {
          if(state.data.isEmpty){
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /* FormFeilds.containerImage(assetImage: 'assets/images/waiting.png',height: 200,width: 200),
                  const SizedBox(
                    height: 50,
                  ), */
                  Text(
                    'Offers page is empty',
                    style: getBoldStyle(color: ColorTheme.wight,fontSize: 16),
                  ),
                ],
              ),
            );
          }else{
            return ListView.separated(
              itemCount: state.data.length,
              itemBuilder: (context,index){
                return buildItemProduct(
                  context: context,
                  itemModel: state.data[index]
                );
              }, 
              separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 22,)
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
  
    Widget buildItemProduct({
    required BuildContext context,
    required ItemModel itemModel,
    // required CategoryModel categoriesModel,
  }){
    return Container(
      width: double.infinity,
      // height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: const Border(
          bottom: BorderSide(color: ColorTheme.porder,width: 1),
          left: BorderSide(color: ColorTheme.porder,width: 1),
          right: BorderSide(color: ColorTheme.porder,width: 1),
          top: BorderSide(color: ColorTheme.porder,width: 1),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            const SizedBox(
                width: 10,
              ),
              SizedBox(
                width: 75,
                height: 75,
                child: PhysicalModel(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  color: Colors.black,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(8),
                  child: itemModel.image == null||  itemModel.image.isNotEmpty? FadeInImage.assetNetwork(
                    placeholder: 'assets/icons/lloading.gif',
                    image: itemModel.image,
                    fit: BoxFit.fill,
                    placeholderFit: BoxFit.fill,
                  ) : Image.asset('assets/images/no_image_available.jpg'),
                ),
              ),
              const SizedBox(width: 18,),
              Flexible(
                fit: FlexFit.tight,
                flex: 3,
                child: Text(
                  itemModel.name,
                  style: getSemiBoldStyle(color: ColorTheme.wight,fontSize: 13,),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const Spacer(),
              Row(
                children: [ 
                  IconButton(
                    onPressed: () => Navigator.pushReplacementNamed(context, previewItemPage, arguments: itemModel),
                    icon: FormFeilds.containerImage(assetImage: 'assets/images/eye.png',height: 18,width: 18),
                  ),
                  IconButton(
                    onPressed: () {
                     /*  Navigator.pushReplacement(
                      context, MaterialPageRoute(
                        builder: (context){
                          return  EditItemPage(itemModel: itemModel,categoriesModel: widget.categoriesModel,);
                        }
                      ),
                    ); */
                    },
                    icon: FormFeilds.containerImage(assetImage: 'assets/images/edit.png',height: 18,width: 18),
                  ),
                  IconButton(
                    onPressed: (){
                      FormFeilds.deleteMessage(
                        context, 
                        'Are you sure to delete?',
                        InkWell(
                          onTap: () async {
                              Navigator.of(context).pushReplacementNamed(itemPage, arguments: widget.categoriesModel);
                            widget.itemModel.add(DeleteDataEvent(id: itemModel.id, files: const ['image']));
                            // Navigator.push(context, MaterialPageRoute(builder: (_)=> ShippingPage(categoriesModel: widget.categoriesModel,)));
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
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0,12,0,5),
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
    );
  }
}