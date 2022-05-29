// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:morasel/app/controllers/setting_controller.dart';
import '../../../../controllers/detail_controller.dart';
import 'department.dart';
import 'participant_list.dart';

class Participant extends GetView<DetailController> {
  Participant({Key? key}) : super(key: key);
  DetailController detailController = Get.find();
  SettingController settingController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Container();
  }

  showAction(
    context,
  ) =>
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        enableDrag: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        builder: (context) => Container(
          decoration: BoxDecoration(
              border: Border.all(width: 0.1),
              borderRadius: const BorderRadius.all(Radius.circular(20.0))),
          child: Column(children: [
            const SizedBox(
              height: 60,
            ),
            department('Departments'),
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 2.0,
                bottom: 10,
              ),
              child: Container(
                height: 250,
                width: 400,
                decoration: BoxDecoration(
                    border: Border.all(width: 0.1),
                    borderRadius:
                        const BorderRadius.all(Radius.circular(20.0))),
                child: participantList(detailController, 0),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            department('Employees'),
            Padding(
              padding: const EdgeInsets.only(
                left: 30,
                right: 30,
                top: 2.0,
                bottom: 10,
              ),
              child: Container(
                height: 250,
                width: 400,
                decoration: BoxDecoration(
                    border: Border.all(width: 0.1),
                    borderRadius:
                        const BorderRadius.all(Radius.circular(20.0))),
                child: participantList(detailController, 1),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  child: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(
                      Icons.cancel,
                      color: Colors.grey,
                      size: 20,
                    ),
                  ),
                ),
                TextButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(150, 50),
                    textStyle: const TextStyle(fontSize: 20),
                    primary: Colors.white,
                    onPrimary: Colors.black,
                  ),
                  child: Row(children: [
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Save'.tr,
                      style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 10,
                          fontWeight: FontWeight.bold),
                    ),
                  ]),
                  onPressed: () {
                    Get.back();
                  },
                ),
                TextButton(
                  onPressed: () => controller.restSwchSend(),
                  child: Text(
                    'Reset'.tr,
                    style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 10,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ]),
        ),
      );
}
