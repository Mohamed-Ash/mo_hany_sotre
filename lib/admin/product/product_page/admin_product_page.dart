import 'package:flutter/material.dart';
import 'package:m_hany_store/admin/admin_interface.dart';
import 'package:m_hany_store/core/form_fields/button_form_feilds.dart';
import 'package:m_hany_store/core/routes/string_route.dart';
import 'package:m_hany_store/core/theme/colors/color_theme.dart';
import 'package:m_hany_store/core/theme/fonts/style.dart';

class AdminProductsPage extends AdminInterface{
  const AdminProductsPage({super.key});

  @override
  Widget buildBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 33, 12, 33),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 22,),
          ListView.separated(
             scrollDirection: Axis.vertical,
            // physics:  NeverScrollableScrollPhysics(),
            primary: false,
            shrinkWrap: true,
            // scrollDirection: Axis.horizontal,
            itemBuilder: (context ,index)=> buildItemProduct(context), 
            separatorBuilder: (context ,index)=> const Divider(
              color: ColorTheme.porder,
              thickness: 1,
            ),
            itemCount: 4,
          ),
          const Spacer(),
          InkWell(
            onTap: () => Navigator.pushNamed(context, addItemProductPage),
            child: FormFeilds.buttonFormField(
              title: 'Add  new Product',
              dPadding: false,
              heightButton: 40,
              colorButton: ColorTheme.primary
            ),
          ),
        ],
      ),
    );
  }
  Widget buildItemProduct(context){
    return Row(
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            // color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            image: const DecorationImage(
              fit: BoxFit.contain,
              image: NetworkImage('https://www.mhany-store.com/IMG/VALO/004.jpg')
            ),
          ),
        ),
        const SizedBox(width: 33,),
        Text('fifa 22',style: getSemiBoldStyle(color: ColorTheme.wight,fontSize: 18),),
        const Spacer(),
          Row(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () =>Navigator.pushNamed(context, previewItemProductPage) , 
              icon: FormFeilds.containerImage(assetImage: 'assets/images/eye.png',height: 18,width: 18),
            ),
            IconButton(
              onPressed: () => Navigator.pushNamed(context, editItemProductPage),
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
}