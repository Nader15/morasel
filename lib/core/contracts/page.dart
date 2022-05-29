import 'package:get/get.dart';

// ignore: must_be_immutable
abstract class Page extends GetPage {
  Page(
      {required name,
      required screen,
      binding,
      List<GetMiddleware>? middleware})
      : super(
            name: name,
            page: () => screen,
            binding: binding,
            middlewares: middleware);
}
