// ignore_for_file: must_be_immutable
import 'package:toggle_switch/toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:morasel/app/views/screens/box/box.dart';
import '../../../controllers/detail_controller.dart';

class Reply extends GetView<DetailController> {
  const Reply({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  showAction(
    context,
  ) =>
      showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(10))),
        builder: (context) => SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 30.0,
              bottom: 60,
              right: 30,
              left: 30,
            ),
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  border: Border.all(width: 0.1),
                  borderRadius: const BorderRadius.all(Radius.circular(10.0))),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Obx(
                    () => ToggleSwitch(
                      minWidth: 80,
                      minHeight: 50,
                      initialLabelIndex: controller.isUrgentReply.value,
                      activeFgColor: Colors.white,
                      activeBgColor: const [Colors.blue],
                      inactiveBgColor: const Color.fromARGB(255, 227, 227, 227),
                      inactiveFgColor: Colors.black,
                      totalSwitches: 3,
                      labels: ['NotUrgent'.tr, 'Urgent'.tr, 'VeryUrgent'.tr],
                      fontSize: 10,
                      onToggle: (index) {
                        controller.isUrgentReply.value = index!;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 100, left: 100),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Important'.tr,
                          style: const TextStyle(
                              color: Colors.black, fontSize: 10),
                        ),
                        Obx(
                          () => Switch.adaptive(
                            activeColor: Colors.blue,
                            onChanged: (bool value) {
                              controller.onChangeisImportantReply(value);
                            },
                            value: controller.isImportantReply.value,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 0.2,
                        color: const Color.fromARGB(255, 192, 192, 192),
                      ),
                      borderRadius: BorderRadius.circular(
                        00.0,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 100, left: 100),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'followUp'.tr,
                            style: const TextStyle(
                                color: Colors.black, fontSize: 10),
                          ),
                          Obx(
                            () => Switch.adaptive(
                              activeColor: Colors.blue,
                              onChanged: (bool value) {
                                controller.onChangeisFollowUpReply(value);
                              },
                              value: controller.isFollowUpReply.value,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    color: Colors.white,
                    width: 240,
                    height: 50,
                    child: TextFormField(
                      style: const TextStyle(color: Colors.black),
                      controller: controller.incReplyCintroller,
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
                          labelText: 'Instructions'.tr,
                        //  labelStyle: Themes().bodyStyle2,
                          prefixText: ' ',
                          suffixStyle:
                              const TextStyle(color: Color(0xff1ba1e3))),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 5,
                      left: 5,
                      bottom: 5,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          child: IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon: const Icon(
                              Icons.cancel,
                              color: Colors.grey,
                              size: 25,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(150, 40),
                            primary: Colors.white,
                            onPrimary: Colors.white,
                          ),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.reply,
                                color: Colors.black,
                                size: 25,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Reply'.tr,
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ],
                          ),
                          onPressed: () {
                            submit();
                          },
                        ),
                        TextButton(
                          onPressed: () => controller.restSwchReply(),
                          child: Text(
                            'Reset'.tr,
                            style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 13,
                                fontWeight: FontWeight.w700),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );

  submit() {
    controller.doReply();
    controller.incReplyCintroller.text = '';
    Get.to(() => BoxScreen());
  }
}
