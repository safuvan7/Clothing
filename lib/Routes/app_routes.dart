
import 'package:app_project/Data/Models/Product_Model.dart';
import 'package:app_project/Routes/routes.dart';
import 'package:app_project/Screens/CheckOut/checkout_screen.dart';
import 'package:app_project/Screens/Order/My_Order.dart';
import 'package:app_project/Screens/email_verify_screen.dart';
import 'package:app_project/Screens/forgot_password.dart';

import 'package:app_project/Screens/Home/Home_Screen.dart';
import 'package:app_project/Screens/Login_pg.dart';
import 'package:app_project/Screens/Onboarding_screen.dart';
import 'package:app_project/Screens/Profile/Profile_Screen.dart';

import 'package:app_project/Screens/Settings/settings.dart';
import 'package:app_project/Screens/SignUp_screen.dart';
import 'package:app_project/Screens/WishList/Favourite_Screen.dart';
import 'package:app_project/Screens/cart/Cart_Screen.dart';
import 'package:app_project/Screens/product_details/product_detail.dart';

import 'package:app_project/Screens/store/Store_Screen.dart';
import 'package:get/get.dart';


class AppRoutes {
  static final pages = [
    GetPage(name: sRoutes.home, page: () => HomeScreen()),
    GetPage(name: sRoutes.store, page: () => StoreScreen()),
    GetPage(name: sRoutes.favourite, page: () => FavouriteScreen()),
    GetPage(name: sRoutes.settings, page: () => SettingsScreen()),
    GetPage(name: sRoutes.productReview, page: () => ProductDetail(product: ProductModel.empty(),)),
    GetPage(name: sRoutes.order, page: () => OrderScreen()),
    GetPage(name: sRoutes.checkout, page: () => CheckoutScreen()),
    GetPage(name: sRoutes.cart, page: () => CartScreen()),
    GetPage(name: sRoutes.userProfile, page: () => ProfileScreen()),
    GetPage(name: sRoutes.userAddress, page: () => ProfileScreen()),
    GetPage(name: sRoutes.signup, page: () => SignupScreen()),
    GetPage(name: sRoutes.verifyEmail, page: () => EmailVerifyScreen()),
    GetPage(name: sRoutes.signIn, page: () => LoginScreen()),
    GetPage(name: sRoutes.forgotPassword, page: () => ForgotPassword()),
    GetPage(name: sRoutes.onBoarding, page: () => OnboardingScreen()),
  ];
}