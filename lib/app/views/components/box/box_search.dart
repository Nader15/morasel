import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:morasel/app/utilities/themes/color.dart';
import '../../../controllers/box_controller.dart';
import '../../../controllers/detail_controller.dart';
import '../../../controllers/setting_controller.dart';

// ignore: must_be_immutable
class BoxSearch extends GetView<BoxController> {
  BoxSearch({Key? key}) : super(key: key);
  DetailController detailController = Get.find();
  SettingController settingController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 15.0,
        right: 20,
        left: 20,
        bottom: 10.0,
      ),
      child: Container(
        padding: null,
        height: 50,
        child: TextField(
          keyboardType: TextInputType.text,
          onChanged: (value) {
            controller.changSearch(value);
          },
          controller: controller.textSearch,
          decoration: InputDecoration(
            filled: true,
            fillColor: settingController.isColor ? lightColor : darkColor,
            //hintText: "search",
            labelText: 'SearchIt'.tr,
            //  labelStyle: Themes().bodyStyle5,
            prefixIcon: const Icon(
              Icons.search,
              color: iconLightColor,
              size: 20,
            ),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey,
                width: 0.4,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: settingController.isColor ? darkColor : lightColor,
                width: 0.2,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
