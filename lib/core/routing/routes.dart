import 'package:hello_world/screens/add_advertisement_screen.dart';
import 'package:hello_world/screens/add_advertisiment_screen/advertising_finish_screen.dart';
import 'package:hello_world/screens/add_complaint_screen.dart';
import 'package:hello_world/screens/all_merchants_screen.dart';
import 'package:hello_world/screens/archive_screen.dart';
import 'package:hello_world/screens/authentication/forget_password_screen.dart';
import 'package:hello_world/screens/authentication/login_screen.dart';
import 'package:hello_world/screens/authentication/new_password_screen.dart';
import 'package:hello_world/screens/authentication/register_screen.dart';
import 'package:hello_world/screens/authentication/restore_account_screen.dart';
import 'package:hello_world/screens/authentication/verification_screen.dart';
import 'package:hello_world/screens/authentication/verify_email_screen.dart';
import 'package:hello_world/screens/branch_screen.dart';
import 'package:hello_world/screens/categories_screen.dart';
import 'package:hello_world/screens/comments_screen.dart';
import 'package:hello_world/screens/favourite_screen.dart';
import 'package:hello_world/screens/home_screen.dart';
import 'package:hello_world/screens/notification_screen.dart';
import 'package:hello_world/screens/products_by_category_screen.dart';
import 'package:hello_world/screens/products_by_store_screen.dart';
import 'package:hello_world/screens/qr_screen.dart';
import 'package:hello_world/screens/search_screen.dart';
import 'package:hello_world/screens/settings/about_us_screen.dart';
import 'package:hello_world/screens/settings/deep_setting_screen.dart';
import 'package:hello_world/screens/settings/faq_screen.dart';
import 'package:hello_world/screens/settings/privacy_policy_screen.dart';
import 'package:hello_world/screens/settings/setting_screen.dart';
import 'package:hello_world/screens/settings/update_profile_screen.dart';
import 'package:hello_world/screens/store_details.dart';
import 'package:hello_world/screens/stores_screen.dart';
import 'package:hello_world/widgets/bottom_nav_bar.dart';

import '../../screens/settings/change_password_screen.dart';

var routes = {
  RegisterScreen.route: (context) => RegisterScreen(),
  LoginScreen.route: (context) => LoginScreen(),
  VerificationScreen.route: (context) => VerificationScreen(),
  MyBottomNavBar.route: (context) => const MyBottomNavBar(),
  SearchScreen.route: (context) => const SearchScreen(),
  NotificationScreen.route: (context) => const NotificationScreen(),
  StoresScreen.route: (context) => StoresScreen(),
  PrivacyPolicyScreen.route: (context) => const PrivacyPolicyScreen(),
  AboutUsScreen.route: (context) => const AboutUsScreen(),
  StoreDetails.route: (context) => StoreDetails(),
  CategoriesScreen.route: (context) => CategoriesScreen(),
  ArchivedScreen.route: (context) => ArchivedScreen(),
  AdvertisingFinishScreen.route: (context) => const AdvertisingFinishScreen(),
  SettingScreen.route: (context) => const SettingScreen(),
  QrScreen.route: (context) => const QrScreen(),
  FAQScreen.route: (context) => const FAQScreen(),
  ProductsByCategoryScreen.route: (context) => ProductsByCategoryScreen(),
  ProductsByStoreScreen.route: (context) => ProductsByStoreScreen(),
  ForgetPasswordScreen.route: (context) => ForgetPasswordScreen(),
  NewPasswordScreen.route: (context) => NewPasswordScreen(),
  VerifyEmailScreen.route: (context) => VerifyEmailScreen(),
  HomeScreen.route: (context) => HomeScreen(),
  ChangePasswordScreen.route: (context) => ChangePasswordScreen(),
  FavouritesScreen.route: (context) => FavouritesScreen(),
  DeepSettingScreen.route: (context) => DeepSettingScreen(),
  UpdateProfileScreen.route: (context) => UpdateProfileScreen(),
  RestoreAccountScreen.route: (context) => RestoreAccountScreen(),
  AddAdvertisementScreen.route: (context) => AddAdvertisementScreen(),
  AddComplaintScreen.route: (context) => AddComplaintScreen(),
  BranchScreen.route: (context) => BranchScreen(),
  AllMerchantsScreen.route: (context) => AllMerchantsScreen(),
  CommentsScreen.route: (context) => CommentsScreen(),
};
