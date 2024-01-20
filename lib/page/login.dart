import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/controllers/authC.dart';
import 'package:store/controllers/loginC.dart';

class LoginPage extends StatelessWidget {
  final c = Get.find<LoginC>();
  final auth = Get.find<AuthC>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: c.email,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            Obx(
              () => TextField(
                controller: c.password,
                autocorrect: false,
                obscureText: c.hidden.value,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () => c.hidden.toggle(),
                    icon: c.hidden.isTrue
                        ? Icon(Icons.remove_red_eye)
                        : Icon(Icons.remove_red_eye_outlined),
                  ),
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 10),
            Obx(() => CheckboxListTile(
                  value: c.rememberme.value,
                  onChanged: (_) {
                    c.rememberme.toggle();
                  },
                  title: Text('Remember Me'),
                  controlAffinity: ListTileControlAffinity.leading,
                )),
            ElevatedButton(
                onPressed: () {
                  auth.login(c.email.text, c.password.text, c.rememberme.value);
                },
                child: Text('Login'))
          ],
        ),
      ),
    );
  }
}
