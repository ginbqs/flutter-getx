import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:store/controllers/authC.dart';
import 'package:store/controllers/loginC.dart';
import 'package:store/page/login.dart';
import '../page/home.dart';
import '../routes/app_page.dart';

void main() async {
  await GetStorage.init();
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  final loginC = Get.put(LoginC());
  final authC = Get.put(AuthC());

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: authC.autoLogin(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Obx(() => GetMaterialApp(
                  home: authC.isAuth.isTrue ? HomePage() : LoginPage(),
                  getPages: AppPage.pages,
                ));
          }
          return MaterialApp(
              home: Scaffold(
            body: Center(child: CircularProgressIndicator()),
          ));
        });
  }
}
