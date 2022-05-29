import 'package:flutter/material.dart';

Widget customContainerIcon({
  Widget? child,
}) =>
    Center(
      child: Container(
        alignment: Alignment.center,
        width: 35,
        height: 35,
        child: child,
      ),
    );
