import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginC extends GetxController {
  var hidden = true.obs;
  var rememberme = false.obs;
  late TextEditingController email;
  late TextEditingController password;

  @override
  void onInit() async {
    super.onInit();
    email = TextEditingController();
    password = TextEditingController();

    final box = GetStorage();
    if (box.read('dataUser') != null) {
      final data = box.read('dataUser') as Map<String, dynamic>;
      email.text = data['email'];
      password.text = data['password'];
      rememberme.value = data['rememberme'];
    }
  }

  @override
  void onClose() {
    email.dispose();
    password.dispose();
    super.onClose();
  }
}
