// ignore_for_file: file_names
import 'package:flutter/material.dart';


AppBar customAppBar({
  String text = '',
  IconData? icon,
  required Function()? function,
}) {
  return AppBar(
    elevation: 0,
    // ignore: sized_box_for_whitespace
    title: Container(
      width: double.infinity,
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                text,
               // style: Themes().titleStyle,
              ),
            ],
          ),
          IconButton(
            onPressed: function,
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
              size: 14,
            ),
          ),
        ],
      ),
    ),
    leading: Icon(
      icon,
      color: Colors.white,
      size: 18,
    ),
    bottom: const PreferredSize(
      preferredSize: Size.fromHeight(-12),
      child: Center(),
    ),
    flexibleSpace: ClipRRect(
      borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(100)),
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomRight,
            colors: [
              Color(0xff1A8FFF),
              Color(0xff115388),
            ],
          ),
        ),
      ),
    ),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(100)),
    ),
  );
}
