import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../base/controllers/box.dart';
import '../../../../core/contracts/screen.dart';
import '../../../controllers/setting_controller.dart';
import '../../components/box/box_appbar.dart';
import '../../components/box/box_drawer.dart';
import '../../components/box/box_list.dart';
import '../../components/box/box_search.dart';

// ignore_for_file: must_be_immutable
class BoxScreen extends Screen<BaseBoxController> {
  SettingController settingController = Get.find();

  BoxScreen() : super();

  @override
  Widget? desktop() {
    return Directionality(
      textDirection: settingController.selectiedLang.value == 'en'
          ? TextDirection.ltr
          : TextDirection.rtl,
      child: SafeArea(
        child: Scaffold(
          body: Row(
            children: [
              Container(),
              const Card(
                child: Text('data'),
                elevation: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget? tablet() {
    return Column(
      children: const [
        Text('ok'),
      ],
    );
  }

  @override
  Widget? phone() {
    return Directionality(
        textDirection: settingController.selectiedLang.value == 'en'
            ? TextDirection.ltr
            : TextDirection.rtl,
        child: SafeArea(
          child: Scaffold(
              appBar: BoxAppBar(
                title: 'Box'.tr + ' ' + 'Transactions'.tr,
              ),
              drawer: BoxDrawer(),
              body: Column(
                children: [
                  BoxSearch(),
                  Expanded(child: BoxList()),
                ],
              )),
        ));
  }
}
