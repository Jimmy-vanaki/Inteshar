import 'package:get/get.dart';
import 'package:Inteshar/app/features/home/view/screens/companies_archive_page.dart';
import 'package:Inteshar/app/features/home/view/screens/product_archive_page.dart';
import 'package:Inteshar/app/features/login/view/screens/welcome_page.dart';
import 'package:Inteshar/app/features/page_view/view/screens/main_page_view.dart';
import 'package:Inteshar/app/features/intro/view/screens/onboarding_page.dart';
import 'package:Inteshar/app/features/intro/view/screens/splash_page.dart';
import 'package:Inteshar/app/features/notif/view/screens/notification_archive.dart';
import 'package:Inteshar/app/features/profile/view/screens/edit_profile_page.dart';
import 'package:Inteshar/app/features/profile/view/screens/profile_page.dart';
import 'package:Inteshar/app/features/purchase_methods/view/screens/bluetooth_page.dart';
import 'package:Inteshar/app/features/services/view/screens/internet_packages_page.dart';
import 'package:Inteshar/app/features/services/view/screens/invoice_page.dart';
import 'package:Inteshar/app/features/text_content/view/screen/text_content.dart';

class Routes {
  static const String home = '/';
  static const String splash = '/splash';
  static const String intro = '/intro';
  static const String notifArchive = '/notifArchive';
  static const String welcomePage = '/welcomePage';
  static const String textContent = '/textContent';
  static const String profilePage = '/profilePage';
  static const String editProfilePage = '/editProfilePage';
  static const String invoicePage = '/invoicePage';
  static const String internetPackagesPage = '/internetPackagesPage';
  static const String productArchivePage = '/productArchivePage';
  static const String companiesArchivePage = '/companiesArchivePage';
  static const String bluetoothPage = '/bluetoothPage';


  static final List<GetPage> pages = [
    GetPage(name: home, page: () => const MainPageView()),
    GetPage(name: splash, page: () => const SplashPage()),
    GetPage(name: intro, page: () => const IntroPage()),
    GetPage(name: notifArchive, page: () => const NotificationArchive()),
    GetPage(name: welcomePage, page: () => const WelcomePage()),
    GetPage(name: profilePage, page: () => const ProfilePage()),
    GetPage(name: editProfilePage, page: () => const EditProfilePage()),
    GetPage(name: invoicePage, page: () => const InvoicePage()),
    GetPage(name: productArchivePage, page: () => const ProductArchivePage()),
    GetPage(name: companiesArchivePage, page: () => const CompaniesArchivePage()),
    GetPage(name: bluetoothPage, page: () => BluetoothPage()),
    GetPage(name: internetPackagesPage, page: () => const InternetPackagesPage()),
    GetPage(
      name: textContent,
      page: () {
        final TextContent content = Get.arguments;
        return content;
      },
    ),
  ];
}
