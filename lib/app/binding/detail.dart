import 'package:get/instance_manager.dart';
import 'package:morasel/app/controllers/pdf_controller.dart';
import '../controllers/box_controller.dart';
import '../controllers/detail_controller.dart';
import '../controllers/setting_controller.dart';

class DetailBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DetailController());
    Get.lazyPut(() => BoxController());
    Get.lazyPut(() => SettingController(), fenix: true);
    Get.lazyPut(() => PdfController());
  }
}
