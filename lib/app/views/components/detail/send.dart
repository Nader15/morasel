// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:morasel/app/views/components/detail/participant/participant.dart';
import 'package:morasel/app/views/screens/box/box.dart';
import 'package:toggle_switch/toggle_switch.dart';
import '../../../controllers/detail_controller.dart';

class Send extends GetView<DetailController> {
  const Send({Key? key}) : super(key: key);

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
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(width: 0.1),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10.0))),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 15,
                        ),
                        Obx(
                          () => ToggleSwitch(
                            minWidth: 80,
                            initialLabelIndex: controller.isUrgentSend.value,
                            activeFgColor: Colors.white,
                            activeBgColor: const [Colors.blue],
                            inactiveBgColor:
                                const Color.fromARGB(255, 227, 227, 227),
                            inactiveFgColor: Colors.black,
                            totalSwitches: 3,
                            fontSize: 10,
                            labels: [
                              'NotUrgent'.tr,
                              'Urgent'.tr,
                              'VeryUrgent'.tr
                            ],
                            onToggle: (index) {
                              controller.isUrgentSend.value = index!;
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
                                    controller.onChangeisImportantSend(value);
                                  },
                                  value: controller.isImportantSend.value,
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
                            padding:
                                const EdgeInsets.only(right: 100, left: 100),
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
                                      controller.onChangeisFollowUpSend(value);
                                    },
                                    value: controller.isFollowUpSend.value,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20, left: 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  Participant().showAction(context);
                                },
                                child: Row(
                                  children: [
                                    const Icon(Icons.fact_check),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    Text(
                                      'ChooseDE'.tr,
                                      style: const TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 60,
                          child: Obx(
                            () => ListView.builder(
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemCount: controller.participantListTo.length,
                                itemBuilder: (BuildContext context, int index) {
                                  var item =
                                      controller.participantListTo[index];

                                  return SizedBox(
                                    width: 300,
                                    child: Padding(
                                      padding: const EdgeInsets.all(0.0),
                                      child: Card(
                                        elevation: 2,
                                        child: ListTile(
                                          leading: Icon(
                                            controller.getTypeParticip(
                                                item['participanttype']),
                                            size: 30,
                                            color: Colors.blue,
                                          ),
                                          title: Text(
                                            item['participantName'],
                                            style:
                                                const TextStyle(fontSize: 10),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                          ),
                        ),
                        Container(
                          color: Colors.white,
                          width: 240,
                          height: 40,
                          child: TextFormField(
                            style: const TextStyle(color: Colors.black),
                            controller: controller.incSendCintroller,
                            textAlign: TextAlign.right,
                            decoration: InputDecoration(
                                border: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
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
                                //    labelStyle: Themes().bodyStyle2,
                                prefixText: ' ',
                                suffixStyle:
                                    const TextStyle(color: Color(0xff1ba1e3))),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 5,
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
                                      Icons.send,
                                      color: Colors.black,
                                      size: 15,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'Send'.tr,
                                      //  style: Themes().buttonStyle,
                                    ),
                                  ],
                                ),
                                onPressed: () {
                                  submit();
                                },
                              ),
                              TextButton(
                                onPressed: () => controller.restSwchSend(),
                                child: Text(
                                  'Reset'.tr,
                                  style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ));
  submit() {
    controller.doSend();
    Get.to(() => BoxScreen());
    controller.incSendCintroller.clear();
  }
}
