import 'package:flutter/material.dart';
import 'package:m_hany_store/core/model/item_model.dart';
import 'package:m_hany_store/core/routes/string_route.dart';
import 'package:m_hany_store/core/theme/colors/color_theme.dart';
import 'package:m_hany_store/core/theme/fonts/style.dart';

// ignore: must_be_immutable
class ProductItemWidget extends StatefulWidget {
  final ItemModel itemModel;
  late  bool isSelected;

  ProductItemWidget({Key? key,required this.itemModel}) : super(key: key);

  @override
  State<ProductItemWidget> createState() => _ProductItemWidgetState();
}

class _ProductItemWidgetState extends State<ProductItemWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          Navigator.pushNamed(context, previewProductPage,arguments: widget.itemModel);
        });
      },
      child: Container(
        width: 180,
        height: 180,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: ColorTheme.darkAppBar
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 180,
              height: 200, 
              child: PhysicalModel(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                color: Colors.black,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(8),
                child:FadeInImage.assetNetwork(
                  placeholder: 'assets/icons/lloading.gif',
                  image: widget.itemModel.image,
                  fit: BoxFit.fill,
                  placeholderFit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                child: Text(
                  widget.itemModel.name,
                  maxLines: 1,
                  overflow: TextOverflow.fade,
                  style: getBoldStyle(color: ColorTheme.wight,fontSize: 16),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
              child: Text(
                '${widget.itemModel.price} LE',
                style: getBoldStyle(color: ColorTheme.wight,fontSize: 16),
              ),
            ),
            const SizedBox(height: 10,)
          ],
        ),
      ),
    );
  }
}