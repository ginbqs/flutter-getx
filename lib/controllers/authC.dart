import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthC extends GetxController {
  var isAuth = false.obs;

  final Map<String, String> _dataUser = {
    'email': 'admin@gmail.com',
    'password': '12345',
  };

  void dialogError(String msg) {
    Get.defaultDialog(title: 'Terjadi kesalahan', middleText: msg);
  }

  Future<void> autoLogin() async {
    final box = GetStorage();
    if (box.read('dataUser') != null) {
      final data = box.read('dataUser') as Map<String, dynamic>;
      login(data['email'], data['password'], data['rememberme']);
    }
  }

  void login(String email, String password, bool rememberme) {
    if (email != '' && password != '') {
      if (GetUtils.isEmail(email)) {
        if (email == _dataUser['email'] && password == _dataUser['password']) {
          final box = GetStorage();
          if (rememberme) {
            box.write('dataUser', {
              'email': email,
              'password': password,
              'rememberme': rememberme,
            });
          } else {
            if (box.read('dataUser') != null) {
              box.erase();
            }
          }
          isAuth.value = true;
        } else {
          dialogError('Data user salah');
        }
      } else {
        dialogError('Email tidak valid');
      }
    } else {
      dialogError('Email & Pass wajib diisi!');
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  void logout() {
    final box = GetStorage();
    if (box.read('dataUser') != null) {
      box.erase();
    }
    isAuth.value = false;
  }
}
