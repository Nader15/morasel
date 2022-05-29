import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:morasel/app/services/files/file.dart';
import 'package:morasel/base/controllers/pdf.dart';
import 'package:path_provider/path_provider.dart';

class PdfController extends BasePdfController {
  late String _text;
  late String contents;
  late var data = ''.obs;
  late TextEditingController dataController;
  GlobalKey<FormState> pdfFromKey = GlobalKey<FormState>();
  String assetPDFPath = '';
  String urlPDFPath = '';

  @override
  void onInit() {
    dataController = TextEditingController();
    getFileFromAsset('assets/data/mypdf.pdf').then((f) {
      assetPDFPath = f.path;
    });

    getFileFromUrl('https://www.ssa.gov/forms/ss-5.pdf').then((f) {
      urlPDFPath = f.path;
    });
    super.onInit();
  }

  @override
  void dispose() {
    dataController.dispose();
    super.dispose();
  }

  String get text => _text;

  readFile() async =>
      await FileService().readData().then((element) => data.value = element);

  writeFile() async => await FileService().writeData(dataController.text);

  Future<File> getFileFromAsset(String asset) async {
    try {
      var data = await rootBundle.load(asset);
      var bytes = data.buffer.asUint16List();
      var dir = await getApplicationDocumentsDirectory();
      File file = File('${dir.path}/data.pdf');
      File assetFile = await file.writeAsBytes(bytes);
      return assetFile;
    } catch (e) {
      throw Exception("Error");
    }
  }

  Future<File> getFileFromUrl(String url) async {
    try {
      var data = await http.get(Uri.parse(url));
      var bytes = data.bodyBytes;
      var dir = await getApplicationDocumentsDirectory();
      File file = File('${dir.path}/data.pdf');
      File urlFile = await file.writeAsBytes(bytes);
      return urlFile;
    } catch (e) {
      throw Exception("Error");
    }
  }
}
