import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/detail_controller.dart';
import '../../../controllers/setting_controller.dart';
import '../../../models/history_model.dart';

// ignore: must_be_immutable
class HistoryList extends GetView<DetailController> {
  HistoryList({Key? key}) : super(key: key);
  TextEditingController textSearch = TextEditingController();
  SettingController settingController = Get.find();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<History>>(
        future: controller.historyService.getLocal(Get.arguments),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('${snapshot.error}');
          } else if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  var item = snapshot.data![index];
                  return Padding(
                    padding: const EdgeInsets.only(
                      top: 10,
                      right: 20,
                      left: 20,
                      bottom: 10,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(width: 0.2),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15.0))),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 10,
                          right: 10,
                          left: 10,
                          bottom: 10,
                        ),
                        child: Card(
                          elevation: 0,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'مرسلة من :',
                                    //   style: Themes().bodyStyle2,
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    item.fromdepartmentname,
                                    //    style: Themes().bodyStyle5,
                                  ),
                                  Text(
                                    item.fromemployeename,
                                    //     style: Themes().bodyStyle5,
                                  ),
                                  Text(
                                    item.transdatetimef,
                                    //   style: Themes().bodyStyle5,
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  const Text(
                                    ' محالة الى :',
                                    //        style: Themes().bodyStyle2,
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  SizedBox(
                                    height: 70,
                                    child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: item.send.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          var sendto = item.send[index];
                                          return Card(
                                            elevation: 2,
                                            shadowColor: Colors.blue,
                                            child: SizedBox(
                                              width: 220,
                                              child: ListTile(
                                                leading: Container(
                                                  height: 50,
                                                  width: 50,
                                                  decoration: BoxDecoration(
                                                      color: Colors.grey[100],
                                                      border: Border.all(
                                                          width: 0.1),
                                                      borderRadius:
                                                          const BorderRadius
                                                                  .all(
                                                              Radius.circular(
                                                                  3.0))),
                                                  child: Icon(
                                                    controller.getTypeParticip(
                                                        sendto.participanttype),
                                                    size: 30,
                                                    color: const Color.fromARGB(
                                                        255, 121, 121, 121),
                                                  ),
                                                ),
                                                title: Text(
                                                  sendto
                                                      .participantemployeename,
                                                  // style: Themes().bodyStyle5,
                                                ),
                                              ),
                                            ),
                                          );
                                        }),
                                  ),
                                ]),
                          ),
                        ),
                      ),
                    ),
                  );
                });
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
