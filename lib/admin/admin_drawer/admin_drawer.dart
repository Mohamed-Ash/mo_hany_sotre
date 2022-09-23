import 'package:flutter/material.dart';
import 'package:m_hany_store/core/form_fields/button_form_feilds.dart';
import 'package:m_hany_store/core/routes/string_route.dart';
import 'package:m_hany_store/core/theme/colors/color_theme.dart';
import 'package:m_hany_store/core/theme/fonts/style.dart';

class AdminDrawer extends StatelessWidget{
   const AdminDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      left: true,
      minimum:  const EdgeInsets.fromLTRB(0, 0, 85, 0),
      maintainBottomViewPadding: true,
      child: Drawer(
        backgroundColor: ColorTheme.darkAppBar,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12, 20, 0, 0),
          child: Column(
            children: [
              InkWell(
                borderRadius: BorderRadius.circular(8),
                highlightColor: Colors.transparent,
                onTap: () => Navigator.pushNamed(context, adminProductPage),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    FormFeilds.containerImage(assetImage: 'assets/images/upload.png',height: 30,width: 30),
                    const SizedBox(
                      width: 12,
                    ),
                    Text(
                      'Product',
                      style: getSemiBoldStyle(color: ColorTheme.white,fontSize: 18),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(2,0,22,0),
                child: InkWell(
                  onTap: () => Navigator.pushNamed(context, discountsProduct),
                  borderRadius: BorderRadius.circular(8),
                  highlightColor: Colors.transparent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      FormFeilds.containerImage(assetImage: 'assets/images/un_discount.png',height: 30,width: 30),
                      const SizedBox(
                        width: 12,
                      ),
                      Text(
                        'Discounts product',
                        style: getSemiBoldStyle(color: ColorTheme.white,fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Divider(
                  color: ColorTheme.primary,
                  thickness: 2.32,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(2,0,22,0),
                child: InkWell(
                  onTap: () => Navigator.pushNamed(context, adminProductPage),
                  borderRadius: BorderRadius.circular(8),
                  highlightColor: Colors.transparent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      FormFeilds.containerImage(assetImage: 'assets/images/un_discount.png',height: 30,width: 30),
                      const SizedBox(
                        width: 12,
                      ),
                      Text(
                        'Total all purchases',
                        style: getSemiBoldStyle(color: ColorTheme.white,fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(2,0,22,0),
                child: InkWell(
                  onTap: () => Navigator.pushNamed(context, adminProductPage),
                  borderRadius: BorderRadius.circular(8),
                  highlightColor: Colors.transparent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      FormFeilds.containerImage(assetImage: 'assets/images/un_discount.png',height: 30,width: 30),
                      const SizedBox(
                        width: 12,
                      ),
                      Text(
                        'All purchases Discount Products',
                        style: getSemiBoldStyle(color: ColorTheme.white,fontSize: 15),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Divider(
                  color: ColorTheme.primary,
                  thickness: 2.32,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              
              Padding(
                padding: const EdgeInsets.fromLTRB(2,0,22,0),
                child: InkWell(
                  onTap: () => Navigator.pushNamed(context, adminProductPage),
                  borderRadius: BorderRadius.circular(8),
                  highlightColor: Colors.transparent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      FormFeilds.containerImage(assetImage: 'assets/images/un_discount.png',height: 30,width: 30),
                      const SizedBox(
                        width: 12,
                      ),
                      Text(
                        'Total all products',
                        style: getSemiBoldStyle(color: ColorTheme.white,fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(2,0,22,0),
                child: InkWell(
                  onTap: () => Navigator.pushNamed(context, adminProductPage),
                  borderRadius: BorderRadius.circular(8),
                  highlightColor: Colors.transparent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      FormFeilds.containerImage(assetImage: 'assets/images/un_discount.png',height: 30,width: 30),
                      const SizedBox(
                        width: 12,
                      ),
                      Text(
                        'All purchase products',
                        style: getSemiBoldStyle(color: ColorTheme.white,fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}