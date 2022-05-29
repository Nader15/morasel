import 'package:get/instance_manager.dart';
import 'package:morasel/app/controllers/pdf_controller.dart';
import '../controllers/box_controller.dart';
import '../controllers/detail_controller.dart';
import '../controllers/setting_controller.dart';

class PdfBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PdfController());
    Get.lazyPut(() => BoxController());
    Get.lazyPut(() => DetailController());
    Get.lazyPut(() => SettingController());
  }
}
