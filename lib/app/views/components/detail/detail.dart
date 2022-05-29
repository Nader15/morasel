import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:morasel/app/views/components/detail/attachement.dart';
import 'package:morasel/app/views/components/detail/info.dart';
import 'package:morasel/app/views/components/detail/history_list.dart';
import '../../../controllers/detail_controller.dart';
import '../../../controllers/setting_controller.dart';

// ignore_for_file: must_be_immutable

class Detail extends GetView<DetailController> {
  Detail({Key? key}) : super(key: key);
  TextEditingController textSearch = TextEditingController();
  SettingController settingController = Get.find();

  @override
  Widget build(BuildContext context) {
    // print(controller.map());
    return TabBarView(
      children: [
        Center(
          child: Info(),
        ),
        Center(
          child: AttachmentList(),
        ),
        Center(
          child: HistoryList(),
        ),
      ],
    );
  }
}
