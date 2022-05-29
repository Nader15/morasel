import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:morasel/app/views/components/detail/floating.dart';
import '../../../../base/controllers/detail.dart';
import '../../../../core/contracts/screen.dart';
import '../../../controllers/setting_controller.dart';
import '../../components/box/box_drawer.dart';
import '../../components/detail/detail.dart';
import '../../components/detail/detail_appbar.dart';
import '../../components/login/form_login.dart';
import '../../components/login/logo.dart';

// ignore: use_key_in_widget_constructors, must_be_immutable
class DetailScreen extends Screen<BaseDetailController> {
  SettingController settingController = Get.find();
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();

  @override
  Widget? desktop() {
    return Directionality(
      textDirection: settingController.selectiedLang.value == 'en'
          ? TextDirection.ltr
          : TextDirection.rtl,
      child: SafeArea(
        child: Scaffold(
          body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background.png'),
                fit: BoxFit.fill,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                top: 120.0,
                right: 30,
                left: 30,
                bottom: 0,
              ),
              child: Card(
                elevation: 20,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      FormLogin(),
                      const Logo(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget? tablet() {
    return Column(
      children: const [Text('')],
    );
  }

  @override
  Widget? phone() {
    return Directionality(
      textDirection: settingController.selectiedLang.value == 'en'
          ? TextDirection.ltr
          : TextDirection.rtl,
      child: SafeArea(
        child: DefaultTabController(
          length: 3,
          child: Scaffold(
            key: _scaffoldkey,

            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(130),
              child: DetailAppBar(
                title: 'Box'.tr + ' ' + 'Transactions'.tr,
              ),
            ),
            drawer: BoxDrawer(),
            body: Detail(),
            // floatingActionButton: More(),
            floatingActionButton: Floating(),
          ),
        ),
      ),
    );
  }
}
