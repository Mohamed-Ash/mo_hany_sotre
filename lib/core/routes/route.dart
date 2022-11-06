import 'package:flutter/material.dart';
import 'package:m_hany_store/admin/admin_panel/admin_panel_page/admin_panel_page.dart';
import 'package:m_hany_store/admin/admin_panel/show_users/show_users_page/show_users_page.dart';
import 'package:m_hany_store/admin/categories/categories_page/add_item_categories_page.dart';
import 'package:m_hany_store/admin/categories/categories_page/categories_page.dart';
import 'package:m_hany_store/admin/categories/categories_page/edit_item_categories_page.dart';
import 'package:m_hany_store/admin/categories/categories_page/preview_item_categories_page.dart';
import 'package:m_hany_store/admin/home/admin_home.dart';
import 'package:m_hany_store/admin/item/item_page/add_item_page.dart';
import 'package:m_hany_store/admin/item/item_page/item_page.dart';
import 'package:m_hany_store/admin/item/item_page/preview_item_page.dart';
import 'package:m_hany_store/admin/messages/messages_page/messages_form_page.dart';
import 'package:m_hany_store/admin/messages/messages_page/messages_page.dart';
import 'package:m_hany_store/admin/reminder/reminder_page/reminder_page.dart';
import 'package:m_hany_store/admin/show_admins/show_admins_page/show_admins_page.dart';
import 'package:m_hany_store/admin/show_offers/show_offers_page/show_offers_page.dart';
import 'package:m_hany_store/core/auth/confirm_email/confirm_email_page/confirm_email_page.dart';
import 'package:m_hany_store/core/auth/login/login_page/login_page.dart';
import 'package:m_hany_store/core/auth/register/register_page/register_page.dart';
import 'package:m_hany_store/core/auth/reset_email/reset_email_page/reset_email_page.dart';
import 'package:m_hany_store/core/auth/reset_password/check_email_page.dart';
import 'package:m_hany_store/core/auth/reset_password/reset_password_page.dart';
import 'package:m_hany_store/core/model/category_model.dart';
import 'package:m_hany_store/core/model/item_model.dart';
import 'package:m_hany_store/core/topic/topic_page/topic_page.dart';
import 'package:m_hany_store/core/page/app_page_layout.dart';
import 'package:m_hany_store/core/checkout/checkout_page.dart';
import 'package:m_hany_store/core/routes/string_route.dart';
import 'package:m_hany_store/core/search/search_page/search_page.dart';
import 'package:m_hany_store/user/product/product_page/preview_product_page.dart';
import 'package:m_hany_store/user/product/product_page/product_page.dart';
import 'package:m_hany_store/user/offer/offer_page/preview_offer_page.dart';


class Routes{

  Route? generateRoute(RouteSettings settings){
    switch (settings.name) {
      // todo: auth
      case registerPage:                                        return MaterialPageRoute(builder: (_)=> RegisterPage());
      case loginPage:                                           return MaterialPageRoute(builder: (_)=> LoginPage());
      case resetPasswordPage:                                   return MaterialPageRoute(builder: (_)=> ResetPasswordPage());
      case checkEmailPage:                                      return MaterialPageRoute(builder: (_)=> const CheckEmailPage());
      case resetEmailPage:                                      return MaterialPageRoute(builder: (_)=> ResetEmailPage());
      case confirmEmailPage:                                    return MaterialPageRoute(builder: (_)=> const ConfirmEmailPage());
      
      // todo: user
      case appPageLayout:                                       return MaterialPageRoute(builder: (_)=> const AppPageLayout());
      case previewProductPage:                                  return MaterialPageRoute(builder: (_)=> PreviewProductPage(itemModel: settings.arguments as ItemModel,));
      case previewSalePage:                                     return MaterialPageRoute(builder: (_)=> PreviewOfferPage(itemModel:  settings.arguments as ItemModel,));
      case productPagse:                                        return MaterialPageRoute(builder: (_)=> ProductPage(categoryModel:  settings.arguments as CategoryModel,));
      case searchPage:                                          return MaterialPageRoute(builder: (_)=> SearchPage());
      case notificationPage:                                    return MaterialPageRoute(builder: (_)=> TopicPage());
        
      // todo: payment methods
      case checkoutpage:                                        return MaterialPageRoute(builder: (_)=> CheckoutPage(itemModel: settings.arguments as ItemModel,));

      // todo: admin

      case adminHome:                                           return MaterialPageRoute(builder: (_)=> const AdminHome());
      case adminPanelPage:                                      return MaterialPageRoute(builder: (_)=> const AdminPanelPage());
      case categoriesPage:                                      return MaterialPageRoute(builder: (_)=> CategoriePage());
      case addItemCategoriesPage:                               return MaterialPageRoute(builder: (_)=> AddItemCategoriesPage());
      case itemPage:                                            return MaterialPageRoute(builder: (_)=> ItemPage(categoriesModel: settings.arguments as CategoryModel,));
      case topicPage:                                           return MaterialPageRoute(builder: (_)=> MessagesPage());
      case messagesFormPage:                                    return MaterialPageRoute(builder: (_)=> MessagesFormPage());
      case editItemCategoriesPage:                              return MaterialPageRoute(builder: (_)=> EditItemCategoriesPage(categoriesModel: settings.arguments as CategoryModel,));
      case previewItemCategoriesPage:                           return MaterialPageRoute(builder: (_)=> PreviewItemCategoriesPage(categoriesModel: settings.arguments as CategoryModel));
      case addItemPage:                                         return MaterialPageRoute(builder: (_)=> AddItemPage(categoriesModel: settings.arguments as CategoryModel,));
      case previewItemPage:                                     return MaterialPageRoute(builder: (_)=> PreviewItemPage(itemModel: settings.arguments as ItemModel,));
      case showUsersPage:                                       return MaterialPageRoute(builder: (_)=> ShowUsers());
      case showAdminsPage:                                      return MaterialPageRoute(builder: (_)=> ShowAdminsPage());
      case showOffersPage:                                      return MaterialPageRoute(builder: (_)=> ShowOffersPage());
      // case adminProductsPage:                                   return MaterialPageRoute(builder: (_)=> const AdminProductsPage());
      // case editItemPage:                                        return MaterialPageRoute(builder: (_)=> EditItemPage(itemModel: settings.name as ItemModel, categoriesModel: settings.name as CategoryModel,));

      // todo: notifications
      case reminderPage:                                        return MaterialPageRoute(builder: (_)=> ReminderPage());




      default:
    }
    return null; 
  }
}