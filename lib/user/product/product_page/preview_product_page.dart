import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:m_hany_store/core/form_fields/button_form_feilds.dart';
import 'package:m_hany_store/core/theme/colors/color_theme.dart';
import 'package:m_hany_store/core/theme/fonts/style.dart';
import 'package:m_hany_store/user/user_interface.dart';

class PreviewProductPage extends UserInterface{
  const PreviewProductPage({super.key});

  @override
  Widget buildBody(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            alignment: Alignment.topLeft,
            children: [
              Container(
                width: double.infinity,
                height: 333,
                decoration: BoxDecoration(
                  borderRadius:BorderRadius.circular(8),
                  //  color: Colors.black,
                  image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      'https://wallpaperaccess.com/full/7070020.jpg'
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 33, 0, 0),
                
                child: Container(
                  width: 44,
                  height: 44  ,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(78, 48, 48, 49),
                    borderRadius: BorderRadius.circular(55),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back_ios),
                      color: Colors.white,
                      onPressed: (() => Navigator.pop(context)),
                    ),
                  ),
                ),
              ),
            ], 
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(14, 15, 14, 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Fifa 22',
                  style: getBoldStyle(color: Colors.white,fontSize: 19),
                ),
                Container(
                  width: 88,
                  height: 25,
                  decoration: BoxDecoration(
                    color: ColorTheme.titleTypePlay,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      'Sports',
                      style: getSemiBoldStyle(color: ColorTheme.authTitle, fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FormFeilds.containerImage(assetImage: 'assets/images/download.png',height: 22,width: 22),
              const SizedBox(
                width: 10,
              ),
              Text(
                '20K Download',
                style: getRegulerStyle(color: ColorTheme.authTitle,fontSize: 14),
              ),
               const SizedBox(
                width: 10,
              ),
              Container(
                width: 2,
                height: 22,
                decoration: const BoxDecoration(
                  color: ColorTheme.authTitle,
                ),
              ),
               const SizedBox(
                width: 10,
              ),
              FormFeilds.containerImage(assetImage: 'assets/images/winner.png',height: 28,width: 28),
              // FormFeilds.containerImage(assetImage: 'assets/images/download.png',height: 28,width: 28),
              const SizedBox(
                width: 10,
              ),
              Text(
                '99 Matchs',
                style: getRegulerStyle(color: ColorTheme.authTitle,fontSize: 14),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(14, 15, 14, 15),
            child: Text(
              'In this section you can find all of FIFA\'s'
              'official documents downloadable in PDF format.'
              'From archived financial reports to published'
              'circulars, on subjects as diverse at the Laws'
              ' of the Game, the regulations of each and every'
              'FIFA tournament, technical reports or even security'
              'regulations, this collection of PDFs available online'
              'via FIFA.com has been collated and organised to help you'
              'find exactly the documents you are looking for.',
              style: getRegulerStyle(
                color: ColorTheme.authTitle,
                fontSize: 14
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          FormFeilds.buttonFormField(title: 'Bye Now',colorButton: ColorTheme.primary, fontSize: 17,widthtButton: 255,dPadding: false)
        ],
      ),
    );
  }
} 