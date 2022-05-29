import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:morasel/app/controllers/login_controller.dart';
import 'package:morasel/app/controllers/setting_controller.dart';
import '../../../../base/controllers/login.dart';
import '../../../../core/contracts/screen.dart';
import '../../components/login/form_login.dart';
import '../../components/login/logo.dart';

// ignore: use_key_in_widget_constructors, must_be_immutable
class LoginScreen extends Screen<BaseLoginController> {
  LoginController logincontroller = Get.put(LoginController());
  SettingController settingController = Get.put(SettingController());

  @override
  Widget? desktop() {
    return Directionality(
      textDirection: settingController.selectiedLang.value == 'en'
          ? TextDirection.ltr
          : TextDirection.rtl,
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.only(
              top: 120.0,
              right: 30,
              left: 30,
              bottom: 0,
            ),
            child: Card(
              elevation: 20,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const Logo(),
                    const SizedBox(
                      height: 15,
                    ),
                    FormLogin(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget? tablet() {
    return Column(
      children: const [
        Text('ok'),
      ],
    );
  }

  @override
  Widget? phone() {
    return Directionality(
      textDirection: settingController.selectiedLang.value == 'en'
          ? TextDirection.ltr
          : TextDirection.rtl,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 120.0,
                right: 30,
                left: 30,
                bottom: 0,
              ),
              child: Column(
                children: [
                  const Logo(),
                  const SizedBox(
                    height: 15,
                  ),
                  FormLogin(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
