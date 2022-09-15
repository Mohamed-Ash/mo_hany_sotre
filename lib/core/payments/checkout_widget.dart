import 'package:flutter/material.dart';
import 'package:m_hany_store/core/form_fields/button_form_feilds.dart';
import 'package:m_hany_store/core/routes/string_route.dart';
import 'package:m_hany_store/core/theme/colors/color_theme.dart';
import 'package:m_hany_store/core/theme/fonts/style.dart';

enum Payment{
  fawry,
  vodafone
}

class CheckoutWidget extends StatefulWidget{

  const CheckoutWidget({super.key});

  @override
  State<CheckoutWidget> createState() => _CheckoutWidgetState();
}

class _CheckoutWidgetState extends State<CheckoutWidget> {
 Payment _payment = Payment.vodafone;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
        child: Column(
          children: [
            Container(
            width: double.infinity,
            height: 155,
            decoration: BoxDecoration(
            color: ColorTheme.darkAppBar,
              borderRadius: BorderRadius.circular(8),
            ),
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const  EdgeInsets.fromLTRB(8, 4, 8, 4),
                    child: Container( 
                      width:90,
                      height: 130,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                          color: Colors.black,
                        image: const DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(
                            // 'https://media-rockstargames-com.akamaized.net/rockstargames-newsite/img/global/games/fob/1280/V.jpg'
                            'https://wallpaperaccess.com/full/7070020.jpg',
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 2, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            // 'EA SPORTS™ FIFA 23 Standard Edition'
                            'EA SPORTS™ FIFA 23 Standard Edition',
                            overflow: TextOverflow.ellipsis,
                            // textWidthBasis:TextWidthBasis.longestLine,
                            // softWrap: true,
                            maxLines: 1,
                            style: getBoldStyle(color: ColorTheme.white,fontSize: 15),// getBoldStyle(color: ColorTheme.white,fontSize: 15),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                           Text(
                            'Electronic Arts',
                            style: getRegulerStyle(color: ColorTheme.white,fontSize: 12,),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 55,
            ),
            Container(
              width: double.infinity,
              height: 320 ,
              decoration: BoxDecoration(
                color: ColorTheme.darkAppBar,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 18, 24, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'Buy Account Steam',
                          style: getBoldStyle(color: ColorTheme.unSelectIconNavBar,fontSize: 18),
                        ),
                        FormFeilds.containerImage(assetImage: 'assets/images/steam.png',height: 35,width: 35,),
                      ],
                    ),
                    const SizedBox(
                      height: 45,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Price',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: getBoldStyle(color: ColorTheme.white,fontSize: 18),
                        ),
                        Text(
                          '160 LE',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: getBoldStyle(color: ColorTheme.white,fontSize: 18),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Divider(
                        color: ColorTheme.primary,
                        thickness: 2.32,
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: getBoldStyle(color: ColorTheme.white,fontSize: 18),
                        ),
                        Text(
                          '160 LE',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: getBoldStyle(color: ColorTheme.white,fontSize: 18),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                      const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Divider(
                        color: ColorTheme.primary,
                        thickness: 2.32,
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Subtotal',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: getBoldStyle(color: ColorTheme.white,fontSize: 18),
                        ),
                        Text(
                          '160 LE',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: getBoldStyle(color: ColorTheme.white,fontSize: 18),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 55,
            ),
            Container(
              width: double.infinity,
              height: 400,
              decoration: BoxDecoration(
                color: ColorTheme.darkAppBar,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 18, 24, 0),
                child: Column(
                  children: [
                  FormFeilds.containerImage(assetImage: 'assets/images/mastercard.png',height: 60,width: 60),
                  const SizedBox(
                    height: 33,
                  ),
                    Container(
                      width: double.infinity,
                      height: 55,
                      decoration:   BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        border: const Border(
                          bottom: BorderSide(
                            width: 1,
                            color: ColorTheme.authHint
                          ),
                          left: BorderSide(
                            width: 1,
                            color: ColorTheme.authHint
                          ),
                          right: BorderSide(
                            width: 1,
                            color: ColorTheme.authHint
                          ),
                          top: BorderSide(
                            width: 1,
                            color: ColorTheme.authHint
                          ),
                        ),
                      ),
                      margin: const  EdgeInsets.fromLTRB(0, 12, 0, 12),
                      child: ListTile(
                        leading: Radio(
                          activeColor: ColorTheme.primary,
                          focusColor: ColorTheme.primary,
                          
                          fillColor: MaterialStateProperty.resolveWith((states) {
                            // If the button is pressed, return green, otherwise blue
                            if (states.contains(MaterialState.pressed)) {
                              return ColorTheme.primary;
                            }
                            return ColorTheme.primary;
                          }),
                          value: Payment.vodafone , 
                          groupValue: _payment, 
                          onChanged: (Payment? value){
                            setState(() {
                              _payment = value!;
                            });
                          }),
                          // title: FormFeilds.containerImage(assetImage: 'assets/images/eepic.png',height: 28,width: 28),
                          title: Text(
                            'Vodafone Cash',
                            style: getSemiBoldStyle(color: ColorTheme.white,fontSize: 18),
                          ),
                          horizontalTitleGap: 33,
                        ),
                      ),
                    Container(
                      width: double.infinity,
                      height: 55,
                      decoration:   BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        border: const Border(
                          bottom: BorderSide(
                            width: 1,
                            color: ColorTheme.authHint
                          ),
                          left: BorderSide(
                            width: 1,
                            color: ColorTheme.authHint
                          ),
                          right: BorderSide(
                            width: 1,
                            color: ColorTheme.authHint
                          ),
                          top: BorderSide(
                            width: 1,
                            color: ColorTheme.authHint
                          ),
                        ),
                      ),
                      margin: const  EdgeInsets.fromLTRB(0, 12, 0, 12),
                      child: ListTile(
                        leading: Radio(
                          fillColor: MaterialStateProperty.resolveWith((states) {
                            if (states.contains(MaterialState.pressed)) {
                              return ColorTheme.primary;
                            }else {
                              return ColorTheme.primary;
                            }
                          }),
                          value: Payment.fawry,
                          groupValue: _payment, 
                          onChanged: (Payment? value){
                            setState(() {
                              _payment = value!;
                            });
                          }),
                          // title: FormFeilds.containerImage(assetImage: 'assets/images/eepic.png',height: 28,width: 28),
                          title: Text(  
                            'fawry',
                            style: getSemiBoldStyle(color: ColorTheme.white),
                          ),
                          horizontalTitleGap: 33,
                        ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    InkWell(
                      onTap: (){
                        buildpopUp();
                      },
                      child: FormFeilds.buttonFormField(
                        title: 'PLACECE ORDER',
                        colorButton: ColorTheme.primary,
                        dPadding: false
                      ),
                    ),
                  ],
                ),
              )
            ),
            const SizedBox(
              height: 55,
            ),
          ],
        ),
      ),
    );
  }

  buildpopUp(){
    return  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: ColorTheme.darkAppBar,
          content: Column(
            mainAxisSize: MainAxisSize.min,//success.gif
            children: <Widget>[
              // FormFeilds.containerImage
              FormFeilds.containerImage(assetImage: 'assets/images/success.gif',height: 150,width: 150),
               const SizedBox(
                height: 22,
              ),
              Text(
                'Success',
                style: getBoldStyle(color: ColorTheme.white,fontSize: 22),
              ),
              const SizedBox(
                height: 22,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  child: const Text("Submitß"),
                  onPressed: () {
                    Navigator.pushNamed(context, appPageLayout);
                  },
                ),
              )
            ],
          ),
        );
      }
    );
  }
}