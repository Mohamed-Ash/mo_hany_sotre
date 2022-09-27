import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:m_hany_store/core/form_fields/button_form_feilds.dart';
import 'package:m_hany_store/core/routes/string_route.dart';
import 'package:m_hany_store/core/theme/colors/color_theme.dart';
import 'package:m_hany_store/core/theme/fonts/style.dart';

class CategoriesWidget extends StatefulWidget {
  const CategoriesWidget({Key? key}) : super(key: key);

  @override
  State<CategoriesWidget> createState() => _CategoriesWidgetState();
}

class _CategoriesWidgetState extends State<CategoriesWidget> {
  List salePRoducts = [];

  CollectionReference getAllProductSale = FirebaseFirestore.instance.collection('categories');
 
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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 22,),
          StreamBuilder(
            stream: getAllProductSale.snapshots(),
            builder: (context, snapshot) {
              if(snapshot.hasData) {
                return ListView.separated(
                  scrollDirection: Axis.vertical,
                  // physics:  NeverScrollableScrollPhysics(),
                  primary: false,
                  shrinkWrap: true,
                  // scrollDirection: Axis.horizontal,
                  itemBuilder: (context ,index)=> buildItemProduct(context, index), 
                  separatorBuilder: (context ,index)=> const Divider(
                    color: ColorTheme.porder,
                    thickness: 1,
                  ),
                  itemCount: salePRoducts.length,
                );
              }else if(snapshot.connectionState == ConnectionState.waiting){
               return const Center(child:  CircularProgressIndicator(),);
              }else {
                return const Text('error 404');
              }
            },
          ),
          const Spacer(),
          InkWell(
            onTap: () => Navigator.pushNamed(context, addItemCategoriesPage),
            child: FormFeilds.buttonFormField(
              title: 'Add  new Categories',
              dPadding: false,
              heightButton: 40,
              colorButton: ColorTheme.primary
            ),
          ),
        ],
      ),
    );
  }
  Widget buildItemProduct(context,index){
    return Row(
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            // color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            image:  DecorationImage(
              fit: BoxFit.contain,
              image: NetworkImage('${salePRoducts[index]['images']}')
            ),
          ),
        ),
        const SizedBox(width: 33,),
        Text('${salePRoducts[index]['title']}',style: getSemiBoldStyle(color: ColorTheme.white,fontSize: 18),),
        const Spacer(),
        Row(
          children: [ 
            IconButton(
              onPressed: () =>Navigator.pushNamed(context, previewItemCategoriesPage) , 
              icon: FormFeilds.containerImage(assetImage: 'assets/images/eye.png',height: 18,width: 18),
            ),
            IconButton(
              onPressed: () => Navigator.pushNamed(context, editItemCategoriesPage),
              icon: FormFeilds.containerImage(assetImage: 'assets/images/edit.png',height: 18,width: 18),
            ),
            IconButton(
              onPressed: () {}, 
              icon: FormFeilds.containerImage(assetImage: 'assets/images/delete.png',height: 18,width: 18),
            ),
          ],
        ),
      ],
    );
  }

  Future<void> getCategories() async {
    QuerySnapshot responseBody  = await getAllProductSale.get();
    for(var element in responseBody.docs){
      setState(() {
        salePRoducts.add(element.data());
      });
    }
  }
 /* Future<void> deleteData(index)async{
    var  postDat = FirebaseFirestore.instance.collection('categories').doc(postDat).delete();
    
    print(postDat);
    print('=========================================');
  }  */
}

/* https://www.mhany-store.com/IMG/HOME/002.jpg
  
 */