import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:m_hany_store/core/bloc/bloc/api_data_bloc.dart';
import 'package:m_hany_store/core/form_fields/button_form_feilds.dart';
import 'package:m_hany_store/core/model/item_model.dart';
import 'package:m_hany_store/core/theme/colors/color_theme.dart';
import 'package:m_hany_store/core/theme/fonts/style.dart';
import 'package:url_launcher/url_launcher.dart';

class CheckoutWidget extends StatefulWidget{
  final ItemModel itemModel;
  final ApiDataBloc<ItemModel> itemBloc; 

  const CheckoutWidget({super.key,required this.itemModel,required this.itemBloc});

  @override
  State<CheckoutWidget> createState() => _CheckoutWidgetState();
}

class _CheckoutWidgetState extends State<CheckoutWidget> {
  double? percent;
  
  @override
  void initState() {
    if(widget.itemModel.offerPrice! > 0 ) {
      percent = widget.itemModel.price - widget.itemModel.offerPrice! ;
    }else{
      percent = widget.itemModel.price ;
    }
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 155,
              decoration: BoxDecoration(
                color: ColorTheme.darkAppBar,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const  EdgeInsets.fromLTRB(8, 10, 8, 4),
                    child: Container( 
                      width:90,
                      height: 130,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                          color: Colors.black,
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(
                            widget.itemModel.image),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 2, 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            '${widget.itemModel.name} ',//Standard Edition
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: getBoldStyle(color: ColorTheme.wight,fontSize: 15),
                          ),
                          const SizedBox(height: 15,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Region',
                                style: getRegulerStyle(color: Colors.grey,fontSize: 14),
                              ),
                              const Spacer(),
                              Container(
                                width: 90,
                                height: 18,
                                decoration: BoxDecoration(
                                  color: Color(widget.itemModel.colorPlatform),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Center(
                                  child: Text(
                                    widget.itemModel.platform,
                                    style: getSemiBoldStyle(color: ColorTheme.wight,),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                            ],
                          ),
                          const SizedBox(height: 15,),
                          Row(
                            children: [
                              Text(
                                'Platform',
                                style: getRegulerStyle(color: Colors.grey,fontSize: 14),
                              ),
                              const Spacer(),
                              Container(
                                width: 90,
                                height: 18,
                                decoration: BoxDecoration(
                                  color: Color(widget.itemModel.colorRegion),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Center(
                                  child: Text(
                                    widget.itemModel.region,
                                      style: getSemiBoldStyle(color: ColorTheme.wight,),  
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              )
                            ],
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
              // height: 320 ,
              decoration: BoxDecoration(
                color: ColorTheme.darkAppBar,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 24, 24, 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Price',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: getBoldStyle(color: ColorTheme.wight,fontSize: 18),
                        ),
                        Text(
                          '${widget.itemModel.price} LE',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: getBoldStyle(color: ColorTheme.wight,fontSize: 18),
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
                        thickness: 1,
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'discount',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: getBoldStyle(color: ColorTheme.wight,fontSize: 18),
                        ),
                        Text(
                          '- $percent LE',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: getBoldStyle(color: ColorTheme.wight,fontSize: 18),
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
                        thickness: 1,
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
                          style: getBoldStyle(color: ColorTheme.wight,fontSize: 18),
                        ),
                        Text(
                          '${widget.itemModel.offerPrice} LE',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: getBoldStyle(color: ColorTheme.wight,fontSize: 18),
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
              decoration: BoxDecoration(
                color: ColorTheme.darkAppBar,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 18, 24, 0),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () async {
                        buildUil();
                        //  setNumberRate();
                      },
                      child: FormFeilds.continueWith(
                        title: 'EasyKash', 
                        assetImage: 'assets/images/mastercard.png',
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ), 
                    GestureDetector(
                      onTap: () => FormFeilds.showMyDialog(
                        context: context, 
                        message: 'Copy Number to pay :',
                        selectMessage: "01068693963",
                        isImage: false,
                        tabButton: true,
                        actions: <Widget>[
                          Center(
                            child: GestureDetector(
                              onTap: () {
                                Clipboard.setData(const ClipboardData(text: "01068693963"),).then(
                                  (_) => Navigator.pop(context));
                              },
                              child: FormFeilds.buttonFormField(
                                dPadding: false,
                                heightButton: 40,
                                widthtButton: 100,
                                title: 'Copy',
                                colorText: ColorTheme.wight,
                                fontSize: 16,
                                colorButton: ColorTheme.primary,
                              ),
                            ),
                          ),
                        ],
                      ),
                      child: FormFeilds.continueWith(
                        title: 'vodafone Cash', 
                        assetImage: 'assets/images/vodafone.png',
                      ),
                    ),
                    const SizedBox(
                      height: 10,
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

  buildUil()async{
    final Uri url = Uri.parse(widget.itemModel.urlLauncher);
    if(await canLaunchUrl(url)) {
      await launchUrl(url).then((value) => Navigator.pop(context));
    } else {
      throw "Could not launch $url";
    }
  }

  /* setNumberRate(){
    int count = 10;
    ItemModel data = ItemModel(
      indexRate: count ++,
      id: widget.itemModel.id, 
      categoryId: widget.itemModel.categoryId, 
      name: widget.itemModel.name, 
      image: widget.itemModel.image, 
      region: widget.itemModel.region, 
      price: widget.itemModel.price, 
      platform: widget.itemModel.platform, 
      colorPlatform: widget.itemModel.colorPlatform, 
      colorRegion: widget.itemModel.colorRegion, 
      urlLauncher: widget.itemModel.urlLauncher,
      createdAt: widget.itemModel.createdAt,
      dateOffer: widget.itemModel.dateOffer,
      isOffer: widget.itemModel.isOffer,
      offerPrice: widget.itemModel.offerPrice,
      percent: widget.itemModel.percent,
      updatedAt: widget.itemModel.updatedAt,
    );
    widget.itemBloc.add(UpdateDataEvent(id: widget.itemModel.id, data:  data.toJson()));
    print('done');
    print('========================');
  } */

 /*  buildpopUp(){
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
                style: getBoldStyle(color: ColorTheme.wight,fontSize: 22),
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
  } */
}