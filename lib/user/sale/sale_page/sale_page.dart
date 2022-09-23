import 'package:flutter/material.dart';
import 'package:m_hany_store/user/sale/sale_widget/sale_widget.dart';
import 'package:m_hany_store/user/user_interface.dart';

class SalePage extends UserInterface{
  const SalePage({super.key});

  @override
  Widget buildBody(BuildContext context) {
    return  const SaleWidget();

    /* return  SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8,22,8,8),
        child: ListView.builder(
          itemBuilder: (context,index){
            return buldItemSale(context);
          }), */
        /* child: Column(
          children: [
            InkWell(
              onTap: () => Navigator.pushNamed(context, previewSalePage),
              child: Container(
                width: double.infinity,
                height: 420,
                decoration: BoxDecoration(
                color: ColorTheme.darkAppBar,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 333,
                      decoration: BoxDecoration(
                        borderRadius:BorderRadius.circular(8),
                        //  color: Colors.black,
                        image: const DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(
                            // 'https://wallpaperaccess.com/full/7070020.jpg',
                            'https://media-rockstargames-com.akamaized.net/rockstargames-newsite/img/global/games/fob/1280/V.jpg'
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15,15,0,15),
                      child: Text(
                        'FIFA 22',
                        style: getSemiBoldStyle(color: ColorTheme.white, fontSize: 16),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15,0,0,5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [ 
                          Container(
                            width: 50,
                            height: 25,
                            decoration: BoxDecoration(
                              color: ColorTheme.primary,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Center(
                              child: Text(
                                '-20%',
                                style: getSemiBoldStyle(color: ColorTheme.white, fontSize: 16),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                           Text.rich(
                            TextSpan(
                              text: '250 LE',
                              style: TextStyle(
                                decoration: TextDecoration.combine(
                                  [
                                    TextDecoration.lineThrough,
                                    TextDecoration.lineThrough,
                                  ],
                                ),
                                fontFamily: FontsTheme.fontFamily,
                                color: Colors.grey,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          Text(
                            '119.99 LE',
                            style: getBoldStyle(color: ColorTheme.white,fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ), */
    //   ),
    // );
  }

  
}