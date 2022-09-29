import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:m_hany_store/admin/admin_interface.dart';
import 'package:m_hany_store/core/form_fields/button_form_feilds.dart';
import 'package:m_hany_store/core/theme/colors/color_theme.dart';
import 'package:m_hany_store/core/theme/fonts/style.dart';

// ignore: must_be_immutable
class EditItemCategoriesPage extends AdminInterface{
  String? id;
  DocumentSnapshot? categories;
  
  final nameController = TextEditingController();
  final formKey =GlobalKey<FormState>();
  
  CollectionReference getAllProductSale = FirebaseFirestore.instance.collection('categories');

  EditItemCategoriesPage({super.key, required this.id,required this.categories});

  @override
  Widget buildBody(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 33,
            ),
            IconButton(
              onPressed: () => Navigator.pop(context), 
              icon: const Icon(Icons.arrow_back_ios,color: Colors.white),
            ),
            StreamBuilder(
            stream: getAllProductSale.snapshots(),
            builder: (context,AsyncSnapshot<QuerySnapshot>  snapshot) {
              // List<DocumentSnapshot> docs = snapshot.data!.docs;
              if(snapshot.hasData) {
                return getData(context: context);
              } else if(snapshot.connectionState == ConnectionState.waiting){
                return const Center(child:  CircularProgressIndicator(),);
              } else {
                return const Text('error 404');
              }
            },
          ),
            const Divider(
              color: ColorTheme.porder,
              thickness: 1,
            ),
            const SizedBox(
              height: 22, 
            ),
            Stack(
              children: [
                Container(
                  height: 50, 
                  width: 100,
                  decoration: BoxDecoration(
                    color: ColorTheme.backroundInput,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                FormFeilds.textField(
                  controller: nameController, 
                  keyboardType: TextInputType.text, 
                  hintText: 'new name'
                ),
              ],
            ),
            const SizedBox(
              height:100, 
            ),
            FormFeilds.buttonFormField(
              widthtButton: double.infinity,
              heightButton: 50,
              dPadding: false,
              title: 'Done',
              colorButton: ColorTheme.primary, 
            ),
          ],
        ),
      ),
    );
  }
  Widget getData({
   required BuildContext context, 
  }){
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 300,
          decoration:  BoxDecoration(
            // color: Colors.white,
            // borderRadius: BorderRadius.circular(12),
            image: DecorationImage(
              fit: BoxFit.contain,
              image: NetworkImage(categories!['images'])
            ),
          ),
        ),
        const SizedBox(
          height: 22  ,
        ),
        const Divider(
          color: ColorTheme.porder,
          thickness: 1,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(18,0,18,0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Name',
                style: getRegulerStyle(color: ColorTheme.hintText,fontSize: 15),  
              ),
              Text(
                '${categories!['name']}',
                style: getSemiBoldStyle(color: ColorTheme.white,),  
              ),
            ],
          ),
        ),  
        const Divider(
          color: ColorTheme.porder,
          thickness: 1,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(18,0,18,0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Creatged at ',
                style: getRegulerStyle(color: ColorTheme.hintText,fontSize: 15),  
              ),
              Text(
                '${categories!['craeted at']}',
                style: getSemiBoldStyle(color: ColorTheme.white,),  
              ),
            ],
          ),
        ),  
        const Divider(
          color: ColorTheme.porder,
          thickness: 1,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(18,0,18,0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Updated At ',
                style: getRegulerStyle(color: ColorTheme.hintText,fontSize: 15),  
              ),
              Text(
                '2022/9/9 09:30 pm',
                style: getSemiBoldStyle(color: ColorTheme.white,),  
              ),
            ],
          ),
        ),  
      ],
    );
  }
}