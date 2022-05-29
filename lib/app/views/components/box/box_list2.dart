import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:morasel/app/models/content_model.dart';
import '../../../controllers/box_controller.dart';
import '../../../controllers/detail_controller.dart';
import '../../../controllers/setting_controller.dart';
import '../../screens/detail/detail.dart';

// ignore: must_be_immutable
class BoxList extends GetView<BoxController> {
  BoxList({Key? key}) : super(key: key);

  DetailController detailController = Get.find();
  SettingController settingController = Get.find();

  @override
  Widget build(BuildContext context) {
    //  print(controller.getData());
    return FutureBuilder<List<Content>>(
        future: controller.getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('${snapshot.error}');
          } else if (snapshot.hasData) {
            controller.listBox.value = snapshot.data!;
            return RefreshIndicator(
              onRefresh: controller.refreshList,
              color: Colors.white,
              backgroundColor: Colors.blue,
              child: Obx(
                () => ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: controller.listBox.length,
                    itemBuilder: (BuildContext context, int index) {
                      var item = controller.listBox[index];
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
                                          child: controller
                                              .getSteptype(item.steptype),
                                        )),
                                  ]),
                                ),
                                title: Text(
                                  item.correspondencesubject,
                                  style: TextStyle(
                                    color: controller.color(
                                        item.importancelevel,
                                        item.urgencylevel),
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
                                  detailController.creatorname =
                                      item.creatorname;
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
                                  detailController.attachments =
                                      item.attachments;
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
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
