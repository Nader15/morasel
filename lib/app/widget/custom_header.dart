import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utilities/themes/color.dart';

Widget customHeader({
  String text = 'No..',
  Widget infoText = const Text(''),
  IconData? icon,
  required Function()? function,
}) =>
    Container(
      color: Colors.white, //f5f5f5
      padding: const EdgeInsets.only(
        right: 40.0,
        left: 30.0,
      ),
      width: double.infinity,
      height: 45,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                icon,
                color: Get.isDarkMode ? textDarkColor : Colors.black,
                size: 25,
              ),
              const SizedBox(width: 5.0),
              Text(
                text,
                style: TextStyle(
                  color: Get.isDarkMode ? textDarkColor : Colors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          infoText,
          IconButton(
            onPressed: function,
            icon: Icon(
              Icons.arrow_forward_ios,
              color: Get.isDarkMode ? textDarkColor : Colors.black,
              size: 17,
            ),
          ),
        ],
      ),
    );


/*
 customHeader(
                text: 'index'.tr,
                icon: Icons.list_alt,
                function: () {
                  Get.offNamed('/');
                },
              ),
              */