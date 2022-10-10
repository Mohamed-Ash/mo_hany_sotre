// ignore_for_file: unnecessary_null_comparison

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:m_hany_store/core/form_fields/button_form_feilds.dart';
import 'package:m_hany_store/core/theme/colors/color_theme.dart';
import 'package:m_hany_store/core/theme/fonts/style.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({Key? key}) : super(key: key);

  @override
  State<SearchWidget> createState() => SsearchWidgetState();
}

class SsearchWidgetState extends State<SearchWidget> {
  final searchController = TextEditingController();

  List getAllSearch = [];
  String name = '';

  var search =  FirebaseFirestore.instance.collection('Search').where('name',isGreaterThanOrEqualTo: '');

  getData()async{
    try{
      QuerySnapshot responseBody  = await search.get();
      for (var element in responseBody.docs) {
       setState(() {
         getAllSearch.add(element.data()) ;
       });  
        debugPrint(element.data().toString());
      }

    }catch(e){
      debugPrint(e.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 33,
        ),
        Container(
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(
            color:  ColorTheme.backroundInput,
            borderRadius: BorderRadius.circular(8),
          ),
          child: FormFeilds.textField(
            controller: searchController,
            keyboardType: TextInputType.text,
            hintText: 'Search products',
            prefixIcon: const Icon(Icons.search),
            hintTextColor: ColorTheme.hintText,
            onChanged: (value){
              setState(() {
                name = value;
              });
            }
          ),
        ),
        StreamBuilder(
          stream: (name != null || name.isNotEmpty) 
          ? FirebaseFirestore.instance.collection('Search').where('name',isLessThanOrEqualTo: name).snapshots() 
          :FirebaseFirestore.instance.collection('').snapshots(),//search.snapshots(),
          builder: (context,AsyncSnapshot<QuerySnapshot> snapshot) {
            if(snapshot.hasData){
              return Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot data = snapshot.data!.docs[index];
                    return buildItemSearch(snapshot: data);
                  },
                ),
              );
            }else if (snapshot.connectionState == ConnectionState.waiting){
              return const Center( child: CircularProgressIndicator(color: ColorTheme.primary),);
            } else{
              return Expanded(child: Center(child: Text('error 404',style: getSemiBoldStyle(color: ColorTheme.wight,fontSize: 14,),)));
            }
          },
        ),
      ],
    );
  }
  Widget buildItemSearch({
    required DocumentSnapshot snapshot
  }){
    return Container(
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: const Border(
          bottom: BorderSide(color: ColorTheme.porder,width: 1),
          left: BorderSide(color: ColorTheme.porder,width: 1),
          right: BorderSide(color: ColorTheme.porder,width: 1),
          top: BorderSide(color: ColorTheme.porder,width: 1),
        ),
      ),
      child: Row(
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
                  image: '${snapshot['image']}',
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
                snapshot['name'],
                style: getSemiBoldStyle(color: ColorTheme.wight,fontSize: 13,),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const Spacer(),
        ],
      ),
    );
  }
}