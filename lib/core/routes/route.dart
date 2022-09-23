import 'package:flutter/material.dart';
import 'package:m_hany_store/admin/discounts_product/discounts_product_page/discounts_product_page.dart';
import 'package:m_hany_store/admin/home/admin_home.dart';
import 'package:m_hany_store/admin/product/admin_product_page/admin_product_page.dart';
import 'package:m_hany_store/core/auth/login/login_page.dart';
import 'package:m_hany_store/core/auth/register/register_page/register_page.dart';
import 'package:m_hany_store/core/page/app_page_layout.dart';
import 'package:m_hany_store/core/payments/checkout_page.dart';
import 'package:m_hany_store/core/routes/string_route.dart';
import 'package:m_hany_store/user/product/product_page/preview_product_page.dart';
import 'package:m_hany_store/user/sale/sale_page/preview_sale_page.dart';

class Routes{

  Route? generateRoute(RouteSettings settings){
    switch (settings.name) {
      // todo: auth
      case registerPage:                                        return MaterialPageRoute(builder: (_)=>  const RegisterPage());
      case loginPage:                                           return MaterialPageRoute(builder: (_)=>  LoginPage());
      
      // todo: user
      case appPageLayout:                                       return MaterialPageRoute(builder: (_)=> const AppPageLayout());
      case previewProductPage:                                  return MaterialPageRoute(builder: (_)=> const PreviewProductPage());
      case previewSalePage:                                     return MaterialPageRoute(builder: (_)=>  PreviewSalePage());
        
      // todo: payment methods
      case checkoutpage:                                        return MaterialPageRoute(builder: (_)=> const CheckoutPage());

      // todo: admin

      case adminHome:                                           return MaterialPageRoute(builder: (_)=> const AdminHome());
      case adminProductPage:                                    return MaterialPageRoute(builder: (_)=> const AdminProductPage());
      case discountsProduct:                                    return MaterialPageRoute(builder: (_)=> const DiscountsProductPage());





      default:
    }
    return null; 
  }
}