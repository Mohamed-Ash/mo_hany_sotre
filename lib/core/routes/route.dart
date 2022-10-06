import 'package:flutter/material.dart';
import 'package:m_hany_store/admin/categories/categories_page/add_item_categories_page.dart';
import 'package:m_hany_store/admin/categories/categories_page/categories_page.dart';
import 'package:m_hany_store/admin/home/admin_home.dart';
import 'package:m_hany_store/admin/offers/offers_page/edit_item_offers_page.dart';
import 'package:m_hany_store/admin/offers/offers_page/offers_page.dart';
import 'package:m_hany_store/admin/offers/offers_page/preview_item_offers_page.dart';
import 'package:m_hany_store/admin/product/product_page/add_item_product_page.dart';
import 'package:m_hany_store/admin/product/product_page/edit_item_product_page.dart';
import 'package:m_hany_store/admin/product/product_page/admin_product_page.dart';
import 'package:m_hany_store/admin/product/product_page/preview_item_product_page.dart';
import 'package:m_hany_store/core/auth/login/login_page/login_page.dart';
import 'package:m_hany_store/core/auth/register/register_page/register_page.dart';
import 'package:m_hany_store/core/page/app_page_layout.dart';
import 'package:m_hany_store/core/payments/checkout_page.dart';
import 'package:m_hany_store/core/routes/string_route.dart';
import 'package:m_hany_store/user/categories/product/product_page/preview_product_page.dart';
import 'package:m_hany_store/user/categories/product/product_page/product_page.dart';
import 'package:m_hany_store/user/categories/shipping/user_shipping_page/user_shipping_page.dart';
import 'package:m_hany_store/user/sale/sale_page/preview_sale_page.dart';

class Routes{

  Route? generateRoute(RouteSettings settings){
    switch (settings.name) {
      // todo: auth
      case registerPage:                                        return MaterialPageRoute(builder: (_)=> const RegisterPage());
      case loginPage:                                           return MaterialPageRoute(builder: (_)=> const LoginPage());
      
      // todo: user
      case appPageLayout:                                       return MaterialPageRoute(builder: (_)=> const AppPageLayout());
      case previewProductPage:                                  return MaterialPageRoute(builder: (_)=> PreviewProductPage());
      case showSalePage:                                        return MaterialPageRoute(builder: (_)=> PreviewSalePage());
      case productPagse:                                        return MaterialPageRoute(builder: (_)=> ProductPage());
  case userShippingPage:                                        return MaterialPageRoute(builder: (_)=> const UserShippingPage());
        


      // todo: payment methods
      case checkoutpage:                                        return MaterialPageRoute(builder: (_)=> const CheckoutPage());




      // todo: admin

      case adminHome:                                           return MaterialPageRoute(builder: (_)=> const AdminHome());
      case adminProductsPage:                                   return MaterialPageRoute(builder: (_)=> const AdminProductsPage());
      case previewItemProductPage:                              return MaterialPageRoute(builder: (_)=> const PreviewItemProductPage());
      case editItemProductPage:                                 return MaterialPageRoute(builder: (_)=> const EditItemProductPage());
      case addItemProductPage:                                  return MaterialPageRoute(builder: (_)=> const AddItemProductPage());
      
      case categoriesPage:                                      return MaterialPageRoute(builder: (_)=> const CategoriePage());
      case addItemCategoriesPage:                               return MaterialPageRoute(builder: (_)=> const AddItemCategoriesPage());


      // case shippingPage:                                        return MaterialPageRoute(builder: (_)=> const ShippingPage());
      // case addItemShippingPage:                                 return MaterialPageRoute(builder: (_)=> const AddItemShippingPage());
      // case previewItemShippingPage:                             return MaterialPageRoute(builder: (_)=> const PreviewItemShippingPage());
      // case editItemShippingPage:                                return MaterialPageRoute(builder: (_)=> EditItemShippingPage());
      
      
      case offersPage:                                          return MaterialPageRoute(builder: (_)=> const OffersPage());
      case editItemOffersPage:                                  return MaterialPageRoute(builder: (_)=> const EditItemOffersPage());
      case previewItemOffersPage:                               return MaterialPageRoute(builder: (_)=> const PreviewItemOffersPage());

      default:
    }
    return null; 
  }
      // case previewItemCategoriesPage:                           return MaterialPageRoute(builder: (_)=> const PreviewItemCategoriesPage());
}