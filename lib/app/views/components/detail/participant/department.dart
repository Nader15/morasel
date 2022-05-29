import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget department(name) {
  return Padding(
    padding: const EdgeInsets.only(right: 33, bottom: 5, left: 33),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          '$name'.tr,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 13,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );
}
