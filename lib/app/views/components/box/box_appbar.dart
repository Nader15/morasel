import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/box_controller.dart';

class BoxAppBar extends GetView<BoxController> implements PreferredSizeWidget {
  final String title;

  const BoxAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title, style: Theme.of(context).textTheme.headlineLarge),
      centerTitle: true,
      elevation: 0,
    );
  }
}
