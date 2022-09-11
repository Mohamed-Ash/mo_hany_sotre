import 'package:flutter/material.dart';
import 'package:m_hany_store/core/routes/string_route.dart';


class ProductItemWidget extends StatelessWidget {
  const ProductItemWidget({super.key});
// NetworkImage('https://media.gettyimages.com/photos/commuters-cross-a-main-road-next-to-an-advertisement-of-console-game-picture-id180851513?s=612x612') 

Widget product(){
  return Container(
    width: 170,
    height: 222,
    decoration: BoxDecoration(
      borderRadius:BorderRadius.circular(8),
      //  color: Colors.black,
      image: const DecorationImage(
        fit: BoxFit.fill,
        image: NetworkImage(
          'https://media-rockstargames-com.akamaized.net/rockstargames-newsite/img/global/games/fob/1280/V.jpg'
        ),
      ),
    ),
  );
}
  Widget listProduct(){
    return Row(
      children: [
        product(),
        const SizedBox(
          width: 15,
        ),
        product(),
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
        child: Column(
          children: [
            InkWell(
              onTap: ()=> Navigator.pushNamed(context, previewProductPage),
              child: listProduct()
            ),
            const SizedBox(
              height: 12,
            ),
            listProduct(),
            const SizedBox(
              height: 12,
            ),
            listProduct(),
            const SizedBox(
              height: 12,
            ),
           listProduct(),
            const SizedBox(
              height: 12,
            ),
          ],
        ),
      ),
    );
  }
}