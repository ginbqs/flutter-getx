import 'package:get/get.dart';
import '../page/home.dart';
import '../page/login.dart';
import 'route_name.dart';

class AppPage {
  static final pages = [
    GetPage(name: RouteName.home, page: () => HomePage()),
    GetPage(name: RouteName.login, page: () => LoginPage()),
  ];
}
