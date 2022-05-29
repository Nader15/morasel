// ignore: use_key_in_widget_constructors
// ignore: implementation_imports
import 'package:flutter/src/foundation/key.dart';
import 'package:get/get.dart';
import 'package:morasel/core/contracts/controller.dart';

abstract class Component extends GetView<Controller> {
  const Component({Key? key}) : super(key: key);
}
