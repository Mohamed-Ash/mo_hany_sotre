import 'package:flutter/material.dart';
import 'package:m_hany_store/user/categories/shipping/user_shipping_widget/user_shipping_widget.dart';
import 'package:m_hany_store/user/user_interface.dart';

class UserShippingPage extends UserInterface{
  const UserShippingPage({super.key});

  @override
  Widget buildBody(BuildContext context) {
    return const UserShippingWidget();
    /* Column(
      children: [
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2 / 3,
            crossAxisSpacing: 1,
            mainAxisSpacing: 1,
          ),
          itemCount: 4,
          itemBuilder: (context, index) =>  InkWell(
            onTap: ()async{
              // await Navigator.pushNamed(context, previewProduct, arguments: widget.productModel );
            },
            child: Center(
              child: Stack(
                children: [
                  Container(
                    width: 160,
                    height: 250,
                    decoration: BoxDecoration(
                      color: ColorTheme.authTitle,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    // alignment: Alignment.topCenter,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            Container(
                                width: 160,
                                height: 180,
                              decoration: BoxDecoration(
                                borderRadius:BorderRadius.circular(8),
                                color: ColorTheme.wight,
                                image: const DecorationImage(
                                  fit: BoxFit.fill,
                                  image: NetworkImage(
                                    // '${widg1et.productModel.imagePath}'
                                    'https://firebasestorage.googleapis.com/v0/b/mohanystore-268dd.appspot.com/o/shipping%2F365348image_picker1300184095106242854.jpg?alt=media&token=574f36dc-5f32-42b1-8bf6-169f19ab6588'
                                    // 'https://media.istockphoto.com/photos/image-of-brunette-in-fake-fur-coat-with-hood-picture-id535313567?k=20&m=535313567&s=612x612&w=0&h=xU51bRMrO0IV_uhBeys4orEUjktUbwzJVszpNgikKOY='
                                  ),
                                ),
                              ),
                            ),
                           /*  Container(
                              height: 20,
                              width: double.infinity,
                              decoration: BoxDecoration(
                              color: Colors.black38,
                              borderRadius: BorderRadius.circular(8),
                              ),
                              child: Center(
                                child: Text(
                                  'gat',
                                  style: getBoldStyle(color: ColorTheme.wight),
                                ),
                              ),
                            ), */
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8, 3, 0, 0),
                          child: Text(
                            'turky',
                            style: getSemiBoldStyle(color: ColorTheme.wight),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8, 3, 0, 0),
                          child: Text(
                            '120 LE',
                              style: getRegulerStyle(color: ColorTheme.wight),
                          ),
                        ),
                      ],
                    ),
                  ),
                 /*  Positioned(
                    height: 38,
                    right: 10,
                    child: IconButton(
                      icon: const Icon(
                        Icons.abc
                      ),
                      color: Colors.red,
                      onPressed: ()async {
                      },
                    ),
                  ), */
                ],
              ),
            ),
          ),
        ),
      ],
    ); */
  }
}