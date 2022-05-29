import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:morasel/app/services/apis/login.dart';
import 'package:morasel/app/views/screens/box/box.dart';
import 'package:morasel/app/views/screens/login/login.dart';
import '../../base/controllers/login.dart';

class LoginController extends BaseLoginController {
  late LoginService loginService;

  var storage = GetStorage();
  RxBool isLoading = false.obs;
  RxBool isSHow = false.obs;
  final loginFromKey = GlobalKey<FormState>();
  late TextEditingController usernameController, passwordController;

  @override
  void onInit() {
    loginService = LoginService();
    usernameController = TextEditingController();
    passwordController = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  doLogin() async {
    isLoading(true);
    try {
      var token = await loginService.loginLocal(
          username: usernameController.text, password: passwordController.text);
      //await loginService.getEmployeeApi();

      if (token.isNotEmpty) {
        await storage.write("token", token);
        await storage.write("username", usernameController.text);

        loginFromKey.currentState!.save();
        Get.off(() => BoxScreen());
      } else {
        Get.snackbar(
          '',
          'ProblemLogin'.tr,
          titleText: const Text(
            '',
            style: TextStyle(
              color: Colors.red,
              fontSize: 17,
            ),
          ),
          messageText: Text(
            'ProblemLogin'.tr,
            style: const TextStyle(
              color: Colors.red,
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),
          ),
          snackPosition: SnackPosition.TOP,
          colorText: Colors.red,
          duration: const Duration(milliseconds: 1000),
          // animationDuration: const Duration(microseconds: 2000),
          icon: const Icon(
            Icons.warning,
            color: Colors.red,
            size: 30,
          ),
          backgroundColor: Colors.white,
        );
      }
    } finally {
      isLoading(false);
    }
  }

  doLogout() async {
    await storage.remove('token');
    await storage.remove('username');
    Get.to(
      () => LoginScreen(),
    );
  }
}
