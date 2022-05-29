// ignore_for_file: must_be_immutable

import 'package:expendable_fab/expendable_fab.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:morasel/app/views/components/detail/reply.dart';
import 'package:morasel/app/views/components/detail/save.dart';
import 'package:morasel/app/views/components/detail/send.dart';
import '../../../controllers/detail_controller.dart';
import '../../../controllers/setting_controller.dart';

class Floating extends GetView<DetailController> {
  Floating({Key? key}) : super(key: key);
  SettingController settingController = Get.find();

  @override
  Widget build(BuildContext context) {
    return controller.steptype != 3
        ? Padding(
            padding: const EdgeInsets.only(
              top: 8.0,
              bottom: 8.0,
              right: 30,
              left: 30,
            ),
            child: ExpendableFab(
              distance: 70.0,
              children: [
                ActionButton(
                  onPressed: () {
                    Save().openDialog(context);
                    // Get.back();
                    // controller.doSave();
                  },
                  icon: Icon(
                    Icons.save,
                    semanticLabel: 'Save'.tr,
                    color: Colors.orange,
                  ),
                ),
                ActionButton(
                  onPressed: () {
                    const Reply().showAction(context);
                  },
                  icon: Icon(
                    Icons.reply,
                    semanticLabel: 'Reply'.tr,
                    color: const Color.fromARGB(255, 163, 27, 17),
                  ),
                ),
                ActionButton(
                  onPressed: () {
                    const Send().showAction(context);
                  },
                  icon: Icon(
                    Icons.send,
                    semanticLabel: 'Send'.tr,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          )
        : Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 600.0),
              child: Container(
                width: 200,
                decoration: BoxDecoration(
                    border: Border.all(
                  width: 0.2,
                )),
                child: TextButton(
                  onPressed: () {
                    controller.doCopy();
                  },
                  child: const Text(
                    'تم الاطلاع',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ),
          );
  }
}
