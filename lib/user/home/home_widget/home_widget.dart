import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:m_hany_store/core/bloc/bloc/api_data_bloc.dart';
import 'package:m_hany_store/core/form_fields/button_form_feilds.dart';
import 'package:m_hany_store/core/model/category_model.dart';
import 'package:m_hany_store/core/routes/string_route.dart';
import 'package:m_hany_store/core/theme/colors/color_theme.dart';
import 'package:m_hany_store/core/theme/fonts/style.dart';

// ignore: must_be_immutable
class HomeWidget extends StatefulWidget {
  late ApiDataBloc<CategoryModel> categoryBloc;
  
  HomeWidget({Key? key,required this.categoryBloc}) : super(key: key);

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {

 /*  @override
  void initState() {
    super.initState();
   widget.categoryBloc = ApiDataBloc<CategoryModel>();
  } */
  
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ScrollPhysics(),
      child: Column(
        children: [
          
          Container(
            height: 220,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              image: const DecorationImage(
                fit: BoxFit.cover,
                alignment: Alignment.center,
                image: AssetImage('assets/images/bannar.jpg')
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          BlocBuilder(
            bloc: widget.categoryBloc,
            builder: (context, state) {
              if(state is DataLoadingState){
                return  const Center(child: CircularProgressIndicator(color: ColorTheme.primary),);
              } else if(state is DataLoadedState){
                if ( state.data.isEmpty) {
                  return Stack(
                    children: [
                      Text(
                        'page is soon',
                        style: getBoldStyle(color: ColorTheme.wight,fontSize: 16),
                      ),
                      FormFeilds.containerImage(assetImage: 'assets/images/coming_soon.png')
                    ],
                  );
                }else{
                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 2/3,
                      crossAxisCount: 2,
                      crossAxisSpacing: 2,
                      mainAxisSpacing: 2,
                    ),
                    itemBuilder: (context,index) {
                      return buildCategories(
                        context: context,
                        categoriesModel: state.data[index],
                      );
                    } ,
                    itemCount: state.data.length,
                  );
                }
              } else {
                return Text('error 404',style: getSemiBoldStyle(color: ColorTheme.wight,fontSize: 14,),);
              }        
            },
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
  
  Widget buildCategories({
    required BuildContext context,
    required  CategoryModel categoriesModel
  }){
    return InkWell(
      onTap: (){
         Navigator.pushNamed(context, productPagse,arguments: categoriesModel);
      },
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SizedBox(
          width: 180,
          height: 250, 
          child: PhysicalModel(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            color: Colors.black,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(8),
            child:FadeInImage.assetNetwork(
              placeholder: 'assets/icons/lloading.gif',
              image: '${categoriesModel.image}',
              fit: BoxFit.fill,
              placeholderFit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}