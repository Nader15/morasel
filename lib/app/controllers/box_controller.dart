import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:morasel/app/controllers/setting_controller.dart';
import 'package:morasel/app/models/content_model.dart';
import '../../base/controllers/box.dart';
import '../services/apis/box.dart';
import 'dart:core';

class BoxController extends BaseBoxController {
  SettingController settingController = Get.find();

  //late BoxService boxService = BoxService();

  RxList listBox = [].obs;
  var isLoading = true.obs;
  RxList listSearch = [].obs;

  //late RxList<Content> listBox = <Content>[].obs;

  late RxList result;
  late TextEditingController textSearch;
  @override
  void onInit() {
    // ignore: avoid_print
    print('khalid salman alruhaymi');

    //listSearch.value = <Content>[].obs;
    textSearch = TextEditingController();
    getData();
    super.onInit();
  }

  

  getData() async {
    try {
      isLoading(true);
      var list = await BoxService().getLocal();
      listBox.refresh();
      for (var item in list) {
        listSearch.addAll([item]);
      }
      listBox.value = listSearch;
    } finally {
      isLoading(false);
    }
  }

  inernal(type) {
    var s = listSearch.where((item) => item.correspondencetype == type);
    return s.length;
  }

  urgent(type) {
    var x = listSearch.where((item) =>
        item.correspondencetype == type &&
        (item.importancelevel > 0 || item.urgencylevel > 0));
    return x.length;
  }

  Future refreshList() async {
    listBox.clear();
    listSearch.clear();
    BoxService().getLocal().then(
          (value) => listSearch.addAll(value),
        );
    listBox.value = listSearch;
  }

  notUrgent(type) {
    var x = listSearch.where((item) =>
        item.correspondencetype == type &&
        (item.importancelevel < 1 || item.urgencylevel < 1));
    return x.length;
  }

  getImpUrg(imp) {
    switch (imp) {
      case 1:
        return Container(
            width: 65,
            alignment: Alignment.center,
            padding: const EdgeInsets.only(right: 3, left: 3),
            child: const Text(
              '.',
              style: TextStyle(
                fontSize: 60,
                color: Color.fromARGB(255, 176, 28, 18),
              ),
            ));

      case 2:
        return Container(
            width: 65,
            alignment: Alignment.center,
            padding: const EdgeInsets.only(right: 3, left: 3),
            child: const Text(
              '.',
              style: TextStyle(
                color: Color.fromARGB(255, 176, 28, 18),
                fontSize: 60,
              ),
            ));
      case 3:
        return Container(
            width: 65,
            alignment: Alignment.center,
            padding: const EdgeInsets.only(right: 3, left: 3),
            child: Image.asset(
              'assets/images/urgimp.gif',
              width: 20,
              height: 20,
            ));
      default:
        return const Text('');
    }
  }

  getSteptype(step) {
    switch (step) {
      case 3:
        return Container(
            color: const Color.fromARGB(255, 247, 247, 247),
            width: 30,
            alignment: Alignment.center,
            padding: const EdgeInsets.only(right: 3, left: 3),
            child: const Text(
              'صورة',
              style: TextStyle(
                fontSize: 8,
                color: Colors.black,
              ),
            ));

      default:
        return const Text('');
    }
  }

  Color color(type1, type2) => type1 > 0 || type2 > 0
      ? Colors.red
      : (Get.isDarkMode ? Colors.white : Colors.black);

  FontWeight bold(type) => type < 1 ? FontWeight.bold : FontWeight.normal;

  @override
  void dispose() {
    textSearch.dispose();
    super.dispose();
  }

  changes(searchValue) {
    var x = listSearch.where(
        (item) => item.correspondencenumber == int.tryParse(searchValue));

    return x;
  }

  changSearch(searchValue) {
    List<Content> result = [];
    var toInt = int.tryParse(searchValue);
    if (toInt.runtimeType == int) {
      for (var element in listSearch) {
        if (element.correspondencenumber == int.tryParse(searchValue)) {
          result.add(element);
        }
      }
    } else {
      for (var element in listSearch) {
        if (element.correspondencesubject.contains(searchValue)) {
          result.add(element);
        }
      }
    }

    listBox.value = result;
  }
}
