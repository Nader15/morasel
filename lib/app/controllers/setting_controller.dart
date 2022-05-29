import 'dart:ui';
import 'package:get/get.dart';
import 'package:morasel/app/utilities/constans/storage.dart';
import '../../base/controllers/setting.dart';

class SettingController extends BaseSettingController {
  bool isColor = storage.read('isColor') ?? true;

  RxString selectiedLang = 'ar'.obs;
  RxBool isLang = true.obs;
  @override
  // ignore: unnecessary_overrides
  void onInit() {
    super.onInit();
  }

  changMode(color) {
    isColor = !color;
  }

  set setColor(color) => storage.write('isColor', color);
  Future<bool> get getColor async => await storage.read('isColor') ?? false;

  changedLanguge(lang) {
    selectiedLang.value = lang.toString();
    Get.updateLocale(Locale(selectiedLang.value));
    // isLang.value != isLang.value;
  }
}
