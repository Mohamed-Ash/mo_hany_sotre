import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:m_hany_store/core/bloc/categories_bloc/categories_bloc.dart';
import 'package:m_hany_store/core/model/category_model.dart';
import 'package:m_hany_store/core/theme/colors/color_theme.dart';
import 'package:m_hany_store/core/theme/fonts/style.dart';
import 'package:m_hany_store/user/categories/product/product_page/product_page.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {

 @override
  void initState() {
    super.initState();
    BlocProvider.of<CategoriesBloc>(context);
  }

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
                image: AssetImage('assets/images/panner.png')
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          BlocBuilder<CategoriesBloc, CategoriesState>(
            builder: (context, state) {
              if(state is CategoriesLoadingState){
                return  const Center(child: CircularProgressIndicator(color: ColorTheme.primary),);
              } else if(state is GetCategoriesLoadedState){
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
                      categoriesModel: state.categoriesModel[index],
                    );
                  } ,
                  itemCount: state.categoriesModel.length,
                );
              } else if(state is CategoriesErrorState){
                return Text(state.error,style: getSemiBoldStyle(color: ColorTheme.wight,fontSize: 14,));
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
    required  CategoriesModel categoriesModel
  }){
    return InkWell(
      onTap: (){
         Navigator.push(
          context, MaterialPageRoute(
            builder: (context){
              return  ProductPage(categoriesModel: categoriesModel,);
            }
          ),
        );
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
  /* @override
  void initState() {
    getCategories();
    super.initState();
  } */
  
  /* Row(
                      children: [
                        Container(
                          width: 180,
                          height: 250,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.white,
                            image: const DecorationImage(
                              fit: BoxFit.cover,
                              alignment: Alignment.center,
                              image: AssetImage('assets/images/steam_gift_codes.jpg') 
                            ),
                          ),
                        ), 
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: 180,
                          height: 250,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.white,
                            image: const DecorationImage(
                              fit: BoxFit.cover,
                              alignment: Alignment.center,
                              image: AssetImage('assets/images/valorant.jpg') 
                            ),
                          ),
                        ), 
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: (){
                            Navigator.pushNamed(context, userShippingPage);
                          },
                          child: Container(
                            width: 180,
                            height: 250,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.white,
                              image: const DecorationImage(
                                fit: BoxFit.cover,
                                alignment: Alignment.center,
                                image: AssetImage('assets/images/upgrade_gtav.jpg') 
                              ),
                            ),
                          ),
                        ), 
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: 180,
                          height: 250,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.white,
                            image: const DecorationImage(
                              fit: BoxFit.cover,
                              alignment: Alignment.center,
                              image: AssetImage('assets/images/upgrade_red_dead.jpg') 
                            ),
                          ),
                        ), 
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                      Row(
                      children: [
                        InkWell(
                          onTap: (){
                            Navigator.pushNamed(context, productPagse);
                          },
                          borderRadius: BorderRadius.circular(12),
                          child: Container(
                            width: 180,
                            height: 250,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.white,
                              image: const DecorationImage(
                                fit: BoxFit.cover,
                                alignment: Alignment.center,
                                image: AssetImage('assets/images/steam_games_offers.jpg') 
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Stack(
                          alignment: Alignment.topCenter,
                          children: [
                            Container(
                              width: 180,
                              height: 250,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.white,
                                image: const DecorationImage(
                                  fit: BoxFit.cover,
                                  alignment: Alignment.center,
                                  image: AssetImage('assets/images/pubg.jpg') 
                                ),
                              ),
                            ),
                            FormFeilds.containerImage(assetImage: 'assets/images/coming_soon.png',height: 60,width: 60),
                          ],
                        ), 
                      ],
                    ), */
