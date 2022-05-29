// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget participantList(controller, type) {
  return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: controller.participantList.length,
      itemBuilder: (BuildContext context, int index) {
        var item = controller.participantList[index];
        var participantType = false;
        if (type == 1) {
          participantType = item.participantType == 1;
        } else {
          participantType = item.participantType != 1;
        }
        return participantType
            // ignore: sized_box_for_whitespace
            ? Container(
                height: 60,
                child: Obx(
                  () => Dismissible(
                    key: UniqueKey(),
                    background: Container(
                      color: Colors.blue,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 30),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(
                              Icons.send,
                              color: Colors.white,
                              size: 20,
                            ),
                            Text('Referral'.tr),
                          ],
                        ),
                      ),
                    ),
                    secondaryBackground: Container(
                      color: Colors.grey,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 30),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(
                              Icons.image,
                              color: Colors.grey,
                              size: 20,
                            ),
                            Text('Copy'.tr),
                          ],
                        ),
                      ),
                    ),
                    onDismissed: (direction) {
                      if (direction == DismissDirection.startToEnd) {
                        controller.participantDepList(
                          item.participantEmployeeId,
                        );

                        controller.participantToMap({
                          'participantEmployeeId': item.participantEmployeeId,
                          'participantDepartmentId':
                              item.participantDepartmentId,
                          'participantType': item.participantType,
                          'participantName': item.participantName,
                          'participantUserId': item.participantUserId,
                          'parentDepartmentId': item.parentDepartmentId,
                          'participantCommitteeId': item.participantCommitteeId,
                          'participantPrefrencesMask':
                              item.participantPrefrencesMask,
                          'participantMobileNumber':
                              item.participantMobileNumber,
                        });
                      } else if (direction == DismissDirection.endToStart) {
                        controller
                            .participantEmpList(item.participantEmployeeId);

                        controller.participantEmpList(
                          item.participantEmployeeId,
                        );

                        controller.participantCCMap({
                          'participantEmployeeId': item.participantEmployeeId,
                          'participantDepartmentId':
                              item.participantDepartmentId,
                          'participantType': item.participantType,
                          'participantName': item.participantName,
                          'participantUserId': item.participantUserId,
                          'parentDepartmentId': item.parentDepartmentId,
                          'participantCommitteeId': item.participantCommitteeId,
                          'participantPrefrencesMask':
                              item.participantPrefrencesMask,
                          'participantMobileNumber':
                              item.participantMobileNumber,
                        });
                      }
                    },
                    child: Container(
                      color: item.participantType == 1
                          ? controller.participantEmp
                                  .contains(item.participantEmployeeId)
                              ? Colors.green[100]
                              : Colors.white
                          : controller.participantDep
                                  .contains(item.participantEmployeeId)
                              ? Colors.orange[100]
                              : Colors.white,
                      child: ListTile(
                        title: Text(
                          item.participantName,
                          style: const TextStyle(
                              color: Colors.black, fontSize: 14),
                        ),
                        trailing: Text(
                          item.participantType == 1
                              ? controller.participantEmp
                                      .contains(item.participantEmployeeId)
                                  ? 'Copy'.tr
                                  : ''.tr
                              : controller.participantDep
                                      .contains(item.participantEmployeeId)
                                  ? 'Referral'.tr
                                  : ''.tr,
                          style: const TextStyle(color: Colors.black),
                        ),
                        onTap: () {},
                      ),
                    ),
                  ),
                ),
              )
            : Container();
      });
}
