import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:morasel/app/controllers/detail_controller.dart';
import 'package:morasel/app/controllers/login_controller.dart';
import 'package:morasel/app/services/cashs/theme_mode.dart';
import 'package:morasel/app/utilities/constans/storage.dart';
import 'package:morasel/app/views/screens/box/box.dart';
import 'package:morasel/app/views/screens/pdf/pdf.dart';
import '../../../controllers/box_controller.dart';
import '../../../controllers/setting_controller.dart';

// ignore: must_be_immutable
class BoxDrawer extends GetView<BoxController> {
  BoxDrawer({Key? key}) : super(key: key);
  LoginController loginController = Get.find();
  SettingController settingController = Get.put(SettingController());
  DetailController detailController = Get.find();

  var username = storage.read('username');

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        alignment: Alignment.center,
        child: ListView(
          padding: const EdgeInsets.all(15.0),
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 27.0,
                  backgroundImage: AssetImage("assets/images/manIcon.jpg"),
                ),
                const SizedBox(height: 9),
                Text(
                  '$username',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 9),
                Text(
                  detailController.employee[0].fullname.toString(),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 9),
                Text(
                  detailController.employee[0].department.departmentname
                      .toString(),
                  style: Theme.of(context).textTheme.titleMedium,
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.logout,
                  ),
                  onPressed: () {
                    loginController.doLogout();
                    Navigator.pop(context);
                  },
                ),
                GetBuilder<SettingController>(
                  builder: (settingController) => IconButton(
                    icon: Icon(
                      Get.isDarkMode
                          ? Icons.wb_sunny_outlined
                          : Icons.nightlight_round_outlined,
                    ),
                    onPressed: () {
                      ThemeModeApp().switchTheme();
                    },
                  ),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.language,
                  ),
                  onPressed: () {
                    if (settingController.selectiedLang.value == 'en') {
                      settingController.selectiedLang.value = 'ar';
                    } else {
                      settingController.selectiedLang.value = 'en';
                    }
                    settingController
                        .changedLanguge(settingController.selectiedLang);
                  },
                ),
              ],
            ),
            const Divider(
              thickness: 0.1,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                    leading: IconButton(
                        icon: const Icon(
                          Icons.person_outlined,
                        ),
                        onPressed: () => Get.to(() => BoxScreen())),
                    title: Text(
                      'BoxPersonal'.tr,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    onTap: () => Get.to(() => BoxScreen())),
                ListTile(
                    leading: IconButton(
                        icon: const Icon(
                          Icons.inbox,
                        ),
                        onPressed: () => Get.to(() => BoxScreen())),
                    title: Text(
                      'BoxIT'.tr,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    onTap: () => Get.to(() => BoxScreen())),
                ListTile(
                    leading: IconButton(
                        icon: const Icon(
                          Icons.inbox,
                        ),
                        onPressed: () => Get.to(() => BoxScreen())),
                    title: Text(
                      'Pdf',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    onTap: () => Get.to(() => PdfScreen())),
                const Divider(
                  thickness: 0.1,
                ),
                const SizedBox(
                  height: 0,
                ),
                // ignore: sized_box_for_whitespace
                Container(
                  width: 400,
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CircleAvatar(
                        radius: 30,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Import'.tr,
                              style: Theme.of(context).textTheme.bodyLarge,
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(
                              height: 1,
                            ),
                            const SizedBox(
                              height: 1,
                            ),
                            Text(
                              controller.inernal('1').toString(),
                              style: Theme.of(context).textTheme.bodyLarge,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                      CircleAvatar(
                        radius: 30,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Export'.tr,
                              style: Theme.of(context).textTheme.bodyLarge,
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(
                              height: 1,
                            ),
                            const SizedBox(
                              height: 1,
                            ),
                            Text(
                              controller.inernal('2').toString(),
                              style: Theme.of(context).textTheme.bodyLarge,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                      CircleAvatar(
                        radius: 30,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'InternalIncoming'.tr,
                              style: Theme.of(context).textTheme.bodyLarge,
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(
                              height: 1,
                            ),
                            Text(
                              controller.inernal('3').toString(),
                              style: Theme.of(context).textTheme.bodyLarge,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
