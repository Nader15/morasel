import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utilities/themes/color.dart';

Widget customCard({
  required String title,
  String? subtitle,
  Widget? leading,
  required Function() function,
  required Key key,
  required Function(dynamic) dismissed,
  required Function() onTap,
}) =>
    Padding(
      padding: const EdgeInsets.only(top: 5.0, right: 10.0, left: 10.0),
      child: Dismissible(
        key: key,
        onDismissed: dismissed,
        child: Card(
          color: Get.isDarkMode ? backgroundDarkColor : backgroundLightColor,
          margin: const EdgeInsets.only(
            top: 10,
            bottom: 10,
            right: 20,
            left: 20,
          ),
          shape:
              const Border(right: BorderSide(color: secondryColor, width: 3)),
          elevation: 1.0,
          borderOnForeground: true,
          child: ListTile(
            title: Text(
              title,
              //       style: Themes().bodyStyle4,
            ),
            leading: leading,
            subtitle: Text(
              subtitle!,
              //    style: Themes().bodyStyle4,
            ),
            trailing: IconButton(
              icon: Icon(
                Icons.delete,
                color: Get.isDarkMode ? Colors.white : secondryColor,
                size: 23,
              ),
              onPressed: function,
            ),
            dense: true,
            onTap: onTap,
          ),
        ),
      ),
    );
