// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:morasel/app/controllers/box_controller.dart';
import 'package:morasel/app/views/screens/box/box.dart';
import '../../../controllers/detail_controller.dart';
import '../../../controllers/setting_controller.dart';

class Save extends GetView<DetailController> {
  Save({Key? key}) : super(key: key);
  SettingController settingController = Get.find();
  BoxController boxController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  Future openDialog(BuildContext context) => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(
            'Saving'.tr,
            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
          ),
          content: TextField(
            decoration: const InputDecoration(hintText: '...'),
            controller: controller.incCintroller,
          ),
          actions: [
            TextButton(
              onPressed: () {
                submit();
              },
              child: Text(
                'Save'.tr,
                style:
                    const TextStyle(fontSize: 10, fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      );
  submit() {
    if (controller.incCintroller.text.length < 3) {
    } else {
      controller.doSave();
      controller.incCintroller.text = '';
      Get.to(() => BoxScreen());
    }
  }
}
