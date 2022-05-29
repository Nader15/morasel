// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:morasel/app/controllers/pdf_controller.dart';
import '../../../controllers/detail_controller.dart';
import '../../../controllers/setting_controller.dart';

class Info extends GetView<DetailController> {
  Info({Key? key}) : super(key: key);
  SettingController settingController = Get.find();
  PdfController pdfController = Get.put(PdfController());

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Container(
        padding: const EdgeInsets.all(10.0),
        margin: const EdgeInsets.all(10.0),
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(width: 0.3, color: Colors.white),
              borderRadius: const BorderRadius.all(Radius.circular(15.0))),
          child: Card(
            elevation: 2,
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Subject'.tr,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(
                        width: 20.0,
                      ),
                      Expanded(
                        child: Text(
                          controller.correspondencesubject,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Text(
                        'No'.tr + ' ' + 'Transaction'.tr,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(
                        width: 40.0,
                      ),
                      Text(
                        controller.correspondencenumber.toString(),
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Text(
                        'Type'.tr + ' ' + 'Transaction'.tr,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(
                        width: 40.0,
                      ),
                      Text(
                        controller.getTypeTranc(controller.correspondencetype),
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Text(
                        'Date'.tr + ' ' + 'Transaction'.tr,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(
                        width: 30.0,
                      ),
                      Text(
                        controller.correspondencedate,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Text(
                        'Create'.tr + ' ' + 'By'.tr,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(
                        width: 25.0,
                      ),
                      Text(
                        controller.fullname,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Text(
                        'Department'.tr,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(
                        width: 60.0,
                      ),
                      Expanded(
                        child: Text(
                          controller.departmentname,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Text(
                        'Hegira'.tr,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(
                        width: 30.0,
                      ),
                      Text(
                        controller.hijricyear.toString(),
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ]);
  }
}
