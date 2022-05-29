import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/box_controller.dart';
import '../../../controllers/detail_controller.dart';
import '../../../controllers/setting_controller.dart';
import '../../screens/detail/detail.dart';

class BoxList2 extends StatefulWidget {
  const BoxList2({Key? key}) : super(key: key);

  @override
  State<BoxList2> createState() => _BoxList2State();
}

class _BoxList2State extends State<BoxList2> {
  BoxController controller = Get.put(BoxController());
  DetailController detailController = Get.put(DetailController());
  SettingController settingController = Get.put(SettingController());

  @override
  void initState() {
    controller.getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.isLoading.value
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : RefreshIndicator(
            onRefresh: controller.refreshList,
            color: Colors.white,
            backgroundColor: Colors.blue,
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: controller.listSearch.length,
                itemBuilder: (BuildContext context, int index) {
                  var item = controller.listSearch[index];
                  return Container(
                    height: 90,
                    padding: const EdgeInsets.only(
                      top: 2.0,
                      right: 19,
                      left: 19,
                      bottom: 0.0,
                    ),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(width: 0.1),
                              borderRadius: const BorderRadius.all(
                                  Radius.circular(10.0))),
                          child: ListTile(
                            // ignore: avoid_unnecessary_containers
                            leading: Container(
                              child: Stack(fit: StackFit.loose, children: [
                                Container(
                                  width: 90,
                                  height: 90,
                                  alignment: Alignment.center,
                                  child: CircleAvatar(
                                    backgroundColor: Colors.blue,
                                    radius: 30.0,
                                    child: Text(
                                      detailController.getTypeTranc(
                                          item.correspondencetype),
                                      //   style: Themes().bodyStyle,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                                Positioned(
                                    bottom: 20,
                                    right: 45,
                                    child: Container(
                                      width: 80,
                                      alignment: Alignment.center,
                                      padding: const EdgeInsets.only(
                                          right: 3, left: 3),
                                      child: controller.getImpUrg(
                                          item.urgencylevel +
                                              item.importancelevel),
                                    )),
                                Positioned(
                                    bottom: -2,
                                    right: 55,
                                    child: Container(
                                      alignment: Alignment.center,
                                      padding: const EdgeInsets.only(
                                          right: 3, left: 3),
                                      child:
                                          controller.getSteptype(item.steptype),
                                    )),
                              ]),
                            ),
                            title: Text(
                              item.correspondencesubject,
                              style: TextStyle(
                                color: controller.color(
                                    item.importancelevel, item.urgencylevel),
                                fontWeight: controller.bold(item.isread),
                                fontSize: 15,
                              ),
                            ),
                            subtitle: Text(
                              'Transaction'.tr +
                                  '   ' +
                                  'No'.tr +
                                  '  ' +
                                  item.correspondencenumber.toString() +
                                  '   ' +
                                  'Date'.tr +
                                  item.correspondencedate,
                              //  style: Themes().bodyStyle3,
                            ),
                            // trailing:
                            //     Text(' ${item.corsid} ', style: Themes().bodyStyle3),
                            onTap: () {
                              Get.to(() => DetailScreen(),
                                  arguments: item.corsid);

                              detailController.corsid = item.corsid;
                              detailController.creatordeptname =
                                  item.creatordeptname;
                              detailController.creatorname = item.creatorname;
                              detailController.receivedonhijridate =
                                  item.receivedonhijridate;
                              detailController.correspondencedate =
                                  item.correspondencedate;
                              detailController.correspondencetype =
                                  item.correspondencetype;
                              detailController.hijricyear = item.hijricyear;
                              detailController.correspondencesubject =
                                  item.correspondencesubject;
                              detailController.correspondencenumber =
                                  item.correspondencenumber;
                              detailController.fullname = item.fullname;
                              detailController.userid = item.userid;
                              detailController.departmentname =
                                  item.departmentname;
                              detailController.wobnum = item.wobnum;
                              detailController.isread = item.isread;
                              detailController.steptype = item.steptype;
                              detailController.attachments = item.attachments;
                              controller.textSearch.text = '';
                              if (item.isread == 0) {
                                detailController.doRead();
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          ));
  }
}

// ignore: must_be_immutable
class BoxList extends GetView<BoxController> {
  BoxList({Key? key}) : super(key: key);

  DetailController detailController = Get.put(DetailController());
  SettingController settingController = Get.put(SettingController());
  @override
  BoxController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.isLoading.value
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : RefreshIndicator(
            onRefresh: controller.refreshList,
            color: Colors.white,
            backgroundColor: Colors.blue,
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: controller.listSearch.length,
                itemBuilder: (BuildContext context, int index) {
                  var item = controller.listSearch[index];
                  return Container(
                    height: 90,
                    padding: const EdgeInsets.only(
                      top: 2.0,
                      right: 19,
                      left: 19,
                      bottom: 0.0,
                    ),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(width: 0.1),
                              borderRadius: const BorderRadius.all(
                                  Radius.circular(10.0))),
                          child: ListTile(
                            // ignore: avoid_unnecessary_containers
                            leading: Container(
                              child: Stack(fit: StackFit.loose, children: [
                                Container(
                                  width: 90,
                                  height: 90,
                                  alignment: Alignment.center,
                                  child: CircleAvatar(
                                    backgroundColor: Colors.blue,
                                    radius: 30.0,
                                    child: Text(
                                      detailController.getTypeTranc(
                                          item.correspondencetype),
                                      //   style: Themes().bodyStyle,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                                Positioned(
                                    bottom: 20,
                                    right: 45,
                                    child: Container(
                                      width: 80,
                                      alignment: Alignment.center,
                                      padding: const EdgeInsets.only(
                                          right: 3, left: 3),
                                      child: controller.getImpUrg(
                                          item.urgencylevel +
                                              item.importancelevel),
                                    )),
                                Positioned(
                                    bottom: -2,
                                    right: 55,
                                    child: Container(
                                      alignment: Alignment.center,
                                      padding: const EdgeInsets.only(
                                          right: 3, left: 3),
                                      child:
                                          controller.getSteptype(item.steptype),
                                    )),
                              ]),
                            ),
                            title: Text(
                              item.correspondencesubject,
                              style: TextStyle(
                                color: controller.color(
                                    item.importancelevel, item.urgencylevel),
                                fontWeight: controller.bold(item.isread),
                                fontSize: 15,
                              ),
                            ),
                            subtitle: Text(
                              'Transaction'.tr +
                                  '   ' +
                                  'No'.tr +
                                  '  ' +
                                  item.correspondencenumber.toString() +
                                  '   ' +
                                  'Date'.tr +
                                  item.correspondencedate,
                              //  style: Themes().bodyStyle3,
                            ),
                            // trailing:
                            //     Text(' ${item.corsid} ', style: Themes().bodyStyle3),
                            onTap: () {
                              Get.to(() => DetailScreen(),
                                  arguments: item.corsid);

                              detailController.corsid = item.corsid;
                              detailController.creatordeptname =
                                  item.creatordeptname;
                              detailController.creatorname = item.creatorname;
                              detailController.receivedonhijridate =
                                  item.receivedonhijridate;
                              detailController.correspondencedate =
                                  item.correspondencedate;
                              detailController.correspondencetype =
                                  item.correspondencetype;
                              detailController.hijricyear = item.hijricyear;
                              detailController.correspondencesubject =
                                  item.correspondencesubject;
                              detailController.correspondencenumber =
                                  item.correspondencenumber;
                              detailController.fullname = item.fullname;
                              detailController.userid = item.userid;
                              detailController.departmentname =
                                  item.departmentname;
                              detailController.wobnum = item.wobnum;
                              detailController.isread = item.isread;
                              detailController.steptype = item.steptype;
                              detailController.attachments = item.attachments;
                              controller.textSearch.text = '';
                              if (item.isread == 0) {
                                detailController.doRead();
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          ));
  }
}
