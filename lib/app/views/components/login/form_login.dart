import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:morasel/app/controllers/setting_controller.dart';
import '../../../controllers/login_controller.dart';

// ignore: must_be_immutable
class FormLogin extends GetView<LoginController> {
  FormLogin({Key? key}) : super(key: key);

  SettingController settingController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Form(
        key: controller.loginFromKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            Container(
              color: Colors.white,
              width: double.infinity,
              height: 60,
              child: TextFormField(
                style: const TextStyle(color: Colors.black),
                controller: controller.usernameController,
                textAlign: TextAlign.right,
                decoration: InputDecoration(
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 0.7,
                      ),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 0.2,
                      ),
                    ),
                    labelText: 'UserName'.tr,
                    //  labelStyle: Themes().bodyStyle2,
                    prefixIcon: const Icon(
                      Icons.person,
                      color: Colors.blue,
                    ),
                    prefixText: ' ',
                    suffixStyle: const TextStyle(color: Color(0xff1ba1e3))),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              color: Colors.white,
              width: double.infinity,
              height: 60,
              child: Obx(
                () => TextFormField(
                  style: const TextStyle(color: Colors.black),
                  controller: controller.passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: controller.isSHow.value ? false : true,
                  textAlign: TextAlign.right,
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey,
                          width: 0.7,
                        ),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                          width: 0.2,
                        ),
                      ),
                      labelText: 'Password'.tr,
                      //labelStyle: Themes().bodyStyle2,
                      prefixIcon: const Icon(
                        Icons.password,
                        color: Color(0xff1ba1e3),
                      ),
                      prefixText: ' ',
                      suffixIcon: IconButton(
                        icon: Icon(
                          controller.isSHow.value
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                        color: const Color(0xff1ba1e3),
                        onPressed: () {
                          controller.isSHow.value = !controller.isSHow.value;
                        },
                      ),
                      suffixStyle: const TextStyle(color: Color(0xff1ba1e3))),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              color: const Color(0xff1ba1e3),
              width: double.infinity,
              height: 60,
              child: ElevatedButton(
                onPressed: () {
                  controller.doLogin();
                },
                child: Text(
                  'Login'.tr,
                  // style: Themes().buttonStyle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
