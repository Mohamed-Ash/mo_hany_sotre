// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:m_hany_store/admin/categories/categories_page/edit_item_categories_page.dart';
import 'package:m_hany_store/admin/categories/categories_page/preview_item_categories_page.dart';
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
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 22,),
          StreamBuilder(
            stream: getAllProductSale.snapshots(),
            builder: (context,AsyncSnapshot<QuerySnapshot>  snapshot) {
              // List<DocumentSnapshot> docs = snapshot.data!.docs;
              if(snapshot.hasData) {
                return Expanded(
                  child: ListView.separated(
                    physics: const ScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context ,index) => buildItemProduct(
                      getAllProductSale: getAllProductSale,
                      categories: snapshot.data!.docs[index],
                      context: context, 
                      // index: index, 
                      id: snapshot.data!.docs[index].id
                    ),
                    separatorBuilder: (context ,index)=> const Divider(
                      color: ColorTheme.porder,
                      thickness: 1,
                    ),
                    itemCount: snapshot.data!.docs.length,
                  ),
                );
              } else if(snapshot.connectionState == ConnectionState.waiting){
                return const Center(child:  CircularProgressIndicator(),);
              } else {
                return const Text('error 404');
              }
            },
          ),
          // const Spacer(),
          const SizedBox(height: 22,),
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
  Widget buildItemProduct({
    required BuildContext context,
    // required int index,
    required String id,
    required DocumentSnapshot categories,
    getAllProductSale
  }){
    return Row(
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
              image: NetworkImage('${categories['images']}')
            ),
          ),
        ),
        
        const SizedBox(width: 18,),
        Flexible(
          // flex: 3,
          child: Text(
            '${categories['name']}',
            style: getSemiBoldStyle(color: ColorTheme.white,fontSize: 14,),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const Spacer(),
        // const SizedBox(width: 12,),
        Row(
          children: [ 
            IconButton(
              onPressed: () =>Navigator.push(
                context, MaterialPageRoute(
                  builder: (context){
                    return PreviewItemCategoriesPage(id: id,categories: categories,);
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
                    return EditItemCategoriesPage(id: id,categories: categories,);
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
                      await FirebaseStorage.instance.refFromURL(categories['images']).delete();
                      await getAllProductSale.doc(id).delete();
                      Navigator.of(context).pop();
                    },
                    child: FormFeilds.buttonFormField(title: 'delete',colorButton: ColorTheme.primary),
                  ),
                  // FormFeilds.buttonFormField(title: 'cancel')
                );
              }, 
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
        /* salePRoducts.add(element.id);
        print('====================');
        print(salePRoducts); */
    }
  }

  
 /* Future<void> deleteData(index)async{
    var  postDat = FirebaseFirestore.instance.collection('categories').doc(postDat).delete();
    
    print(postDat);
    print('=========================================');
  }  */
}

/* https://www.mhany-store.com/IMG/HOME/002.jpg
  return Text("${getAllProductSale.doc().id}");
  
 */