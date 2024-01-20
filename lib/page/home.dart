import 'package:flutter/material.dart';
import 'package:store/controllers/authC.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        actions: [
          IconButton(
              onPressed: () => Get.find<AuthC>().logout(),
              icon: Icon(Icons.logout_sharp))
        ],
      ),
    );
  }
}
