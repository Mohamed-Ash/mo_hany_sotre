// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:m_hany_store/core/bloc/bloc/api_data_bloc.dart';
import 'package:m_hany_store/core/bloc/criteria/where_criteria.dart';
import 'package:m_hany_store/core/form_fields/button_form_feilds.dart';
import 'package:m_hany_store/core/model/category_model.dart';
import 'package:m_hany_store/core/model/item_model.dart';
import 'package:m_hany_store/core/routes/string_route.dart';
import 'package:m_hany_store/core/theme/colors/color_theme.dart';
import 'package:m_hany_store/core/theme/fonts/style.dart';
import 'package:m_hany_store/user/product/product_page/preview_product_page.dart';

// ignore: must_be_immutable
class SearchWidget extends StatefulWidget {
  late ApiDataBloc<ItemModel> itemBloc;
  CategoryModel? categoryModel;
  
  SearchWidget({Key? key,required this.itemBloc,}) : super(key: key);
  
  @override
  State<SearchWidget> createState() => SsearchWidgetState();
}

class SsearchWidgetState extends State<SearchWidget> {
  String name = '';

  final searchController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
              color:  ColorTheme.backroundInput,
              borderRadius: BorderRadius.circular(22),
            ),
            child: FormFeilds.textFormField(
              controller: searchController,
              keyboardType: TextInputType.text,
              hintText: 'Search products',
              prefixIcon: const Icon(Icons.search,color: ColorTheme.wight),

              hintTextColor: ColorTheme.hintText,
              onChanged: (value){
                setState(() {
                  name = value;
                });
              }, 
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        BlocBuilder(
          bloc: widget.itemBloc..add(
            IndexDataEvent(where: WhereCriteria(field: 'name' , isGreaterThanOrEqualTo: name.toString())),
            ),
          // buildWhen: (previous, current) => searchController.text.isNotEmpty,
          // buildWhen: (previous, current) => previous == current,
          builder: (context, state) {
            if (searchController.text == null || searchController.text.isEmpty)  {
              return Expanded(child: Center(child: FormFeilds.containerImage(assetImage: 'assets/images/seo_serching.png',height: 250,width: 250)));
            } else {
              if (state is DataLoadedState) {
                return  Expanded(
                  child: ListView.separated(
                    shrinkWrap: true,
                    separatorBuilder: (context, index) => const SizedBox(height: 12),
                    physics: const ScrollPhysics(),
                    itemCount: state.data.length,
                    itemBuilder: (context, index) => InkWell(
                      onTap: () => Navigator.push(
                        context, MaterialPageRoute(
                          builder: (context) => PreviewProductPage(itemModel: state.data[index]),)),
                      child: buildItemSearch(itemModel: state.data[index]),
                    ),
                  ),
                );
              } else if(state is DataLoadingState){
                  return const Expanded(child: Center(child: CircularProgressIndicator(color: ColorTheme.primary),));
              } else {
                return Text('error 404',style: getSemiBoldStyle(color: ColorTheme.wight,fontSize: 14,),);
              }  
             }
          },
        ),

      ],
    );
  }

  Widget buildItemSearch({
    required  ItemModel itemModel
  }){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, previewProductPage,arguments: itemModel),
        child: Container(
          width: double.infinity,
          // height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: const Border(
              bottom: BorderSide(color: ColorTheme.porder,width: 1),
              left: BorderSide(color: ColorTheme.porder,width: 1),
              right: BorderSide(color: ColorTheme.porder,width: 1),
              top: BorderSide(color: ColorTheme.porder,width: 1),
            ),
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.fromLTRB(10, 10, 30, 10),
            selected: true,
            leading: SizedBox(
              width: 75,
              height: 75,
              child: PhysicalModel(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                color: Colors.black,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(8),
                child:FadeInImage.assetNetwork(
                  placeholder: 'assets/icons/lloading.gif',
                  image: itemModel.image,
                  fit: BoxFit.fill,
                  placeholderFit: BoxFit.contain,
                ),
              ),
            ),
            title: Text(
                itemModel.name,
                style: getSemiBoldStyle(color: ColorTheme.wight,fontSize: 13,),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
            ),
            trailing: Text(
              '${itemModel.price} lE',
              style: getSemiBoldStyle(color: ColorTheme.wight,fontSize: 13,),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
         /*  child: Row(
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
                    child:FadeInImage.assetNetwork(
                      placeholder: 'assets/icons/lloading.gif',
                      image: itemModel.image,
                      fit: BoxFit.fill,
                      placeholderFit: BoxFit.contain,
                    ),
                  ),
                ),
              /* Container(
                width: 75,
                height: 75,
                decoration: BoxDecoration(
                  // color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  image:  DecorationImage(
                    fit: BoxFit.contain,
                      image: NetworkImage(shipping.image)
                    ),
                  ),
                ), */
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
                const SizedBox(width: 10,),
                Flexible(
                  fit: FlexFit.tight,
                  flex: 3,
                  child: Text(
                    '${itemModel.price} lE',
                    style: getSemiBoldStyle(color: ColorTheme.wight,fontSize: 13,),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
            ],
          ), */
        ),
      ),
    );
  }
}



        /* StreamBuilder(
          stream: name != null || name.isNotEmpty
          ? FirebaseFirestore.instance.collection('items').where('name',isEqualTo: name).snapshots() 
          :null,//search.snapshots(),
          builder: (context,AsyncSnapshot<QuerySnapshot> snapshot) {
            if(snapshot.hasData){
              return Expanded(
                child: ListView.builder(
                  
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot data = snapshot.data!.docs[index];
                    return InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ItemModel(categoryModel: data ),));
                      },
                      child: buildItemSearch(snapshot: data));
                  },
                ),
              );
            }else if (snapshot.connectionState == ConnectionState.waiting){
              return const Center( child: CircularProgressIndicator(color: ColorTheme.primary),);
            } else{
              return Expanded(child: Center(child: Text('error 404',style: getSemiBoldStyle(color: ColorTheme.wight,fontSize: 14,),)));
            }
          },
        ), */