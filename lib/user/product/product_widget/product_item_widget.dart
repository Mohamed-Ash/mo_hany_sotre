import 'package:flutter/material.dart';
import 'package:m_hany_store/core/theme/colors/color_theme.dart';
import 'package:m_hany_store/core/theme/fonts/style.dart';


class ProductItemWidget extends StatelessWidget {
  const ProductItemWidget({super.key});
// NetworkImage('https://media.gettyimages.com/photos/commuters-cross-a-main-road-next-to-an-advertisement-of-console-game-picture-id180851513?s=612x612') 
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      height: 220,
      decoration: BoxDecoration(
        color: ColorTheme.primary,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              width: 160,
              height: 180,
            decoration: BoxDecoration(
              borderRadius:BorderRadius.circular(8),
              //  color: Colors.black,
              image: const DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  'https://media.gettyimages.com/photos/commuters-cross-a-main-road-next-to-an-advertisement-of-console-game-picture-id180851513?s=612x612'
                ),
              ),
            ),
          ),
          Padding(
             padding: const EdgeInsets.fromLTRB(8, 3, 0, 0),
             child: Text(
              'Gta v',
               style: getMediumStyle(color: ColorTheme.white),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 3, 0, 0),
            child: Text(
              '140 LE',
              style: getMediumStyle(color: ColorTheme.white),
            ),
          ),
        ],
      ),
    );
  }
}