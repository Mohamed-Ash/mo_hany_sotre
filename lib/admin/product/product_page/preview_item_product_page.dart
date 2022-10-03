import 'package:flutter/material.dart';
import 'package:m_hany_store/admin/admin_interface.dart';
import 'package:m_hany_store/core/theme/colors/color_theme.dart';
import 'package:m_hany_store/core/theme/fonts/style.dart';

class PreviewItemProductPage extends AdminInterface{
  const PreviewItemProductPage({super.key});

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
            Container(
              width: MediaQuery.of(context).size.width,
              height: 300,
              decoration: const BoxDecoration(
                // color: Colors.white,
                // borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  fit: BoxFit.contain,
                  image: NetworkImage('https://www.mhany-store.com/IMG/VALO/004.jpg')
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
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'name',
                    style: getRegulerStyle(color: ColorTheme.hintText,fontSize: 15),  
                  ),
                  const Spacer(),
                  Text(
                    'Valorant',
                    style: getSemiBoldStyle(color: ColorTheme.wight,),  
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
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'creatged at ',
                    style: getRegulerStyle(color: ColorTheme.hintText,fontSize: 15),  
                  ),
                  const Spacer(),
                  Text(
                    '2022/9/9 09:30 pm',
                    style: getSemiBoldStyle(color: ColorTheme.wight,),  
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
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'price',
                    style: getRegulerStyle(color: ColorTheme.hintText,fontSize: 15),  
                  ),
                  const Spacer(),
                  Text(
                    '123 LE',
                    style: getSemiBoldStyle(color: ColorTheme.wight,),  
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
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Region',
                    style: getRegulerStyle(color: ColorTheme.hintText,fontSize: 15),  
                  ),
                  const Spacer(),
                  Text(
                    'Turkey',
                    style: getSemiBoldStyle(color: ColorTheme.wight,),  
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
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'sale ends',
                    style: getRegulerStyle(color: ColorTheme.hintText,fontSize: 15),  
                  ),
                  const Spacer(),
                  Text(
                    '2022/12/22 09:30 pm',
                    style: getSemiBoldStyle(color: ColorTheme.wight,),  
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
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'platform',
                    style: getRegulerStyle(color: ColorTheme.hintText,fontSize: 15),  
                  ),
                  const Spacer(),
                  Text(
                    'steam',
                    style: getSemiBoldStyle(color: ColorTheme.wight,),  
                  ),
                ],
              ),
            ),
            const Divider(
              color: ColorTheme.porder,
              thickness: 1,
            ),
          ],
        ),
      ),
    );
  }

}