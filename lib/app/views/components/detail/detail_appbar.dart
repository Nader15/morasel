import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:morasel/app/controllers/box_controller.dart';

import '../../../controllers/setting_controller.dart';
import '../../screens/box/box.dart';

// ignore: must_be_immutable
class DetailAppBar extends GetView<BoxController> {
  final String title;

  DetailAppBar({
    Key? key,
    required this.title,
  }) : super(key: key);

  SettingController settingController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: AppBar(
        title: Text(title, style: Theme.of(context).textTheme.headlineLarge),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(
              settingController.selectiedLang.value == 'ar'
                  ? Icons.keyboard_arrow_left
                  : Icons.keyboard_arrow_right,
              size: 30,
            ),
            onPressed: () {
              Get.to(() => BoxScreen());
            },
          ),
        ],
        bottom: TabBar(
          indicator: BoxDecoration(borderRadius: BorderRadius.circular(5.0)),
          labelColor: Get.isDarkMode
              ? const Color.fromARGB(255, 190, 190, 190)
              : const Color.fromARGB(255, 98, 98, 98),
          unselectedLabelColor: Get.isDarkMode ? Colors.white : Colors.white,
          tabs: [
            Tab(
              child: Text(
                'Info'.tr,
             //   style: Themes().subHeadingStyle,
              ),
              icon: const Icon(Icons.info),
            ),
            Tab(
              child: Text(
                'Attach'.tr,
               // style: Themes().subHeadingStyle,
              ),
              icon: const Icon(Icons.attach_file),
            ),
            Tab(
              child: Text(
                'Record'.tr,
             //   style: Themes().subHeadingStyle,
              ),
              icon: const Icon(Icons.list_alt),
            ),
          ],
        ),
      ),
    );
  }
}
