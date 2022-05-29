import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:get/get.dart';
import 'package:morasel/app/controllers/pdf_controller.dart';
import 'package:morasel/app/controllers/setting_controller.dart';

// ignore: must_be_immutable
class PdfData extends GetView<PdfController> {
  final String path;
  PdfData(this.path, {Key? key}) : super(key: key);

  SettingController settingController = Get.find();

  @override
  Widget build(BuildContext context) {
   // bool pdfReady = false;
    // ignore: unused_local_variable
    int _totalPages = 0;
    // ignore: unused_local_variable
    int _currentPage = 0;
    // ignore: unused_local_variable
    PDFViewController _pDFViewController;
    return Stack(
      children: [
        PDFView(
          filePath: path,
          autoSpacing: true,
          enableSwipe: true,
          pageSnap: true,
          swipeHorizontal: true,
          onError: (e) {
          },
          onViewCreated: (PDFViewController vc) {
            _pDFViewController = vc;
          },
          onPageChanged: (page, total) {},
          onPageError: (page, e) {},
        ),
      ],
    );
    // floatingActionButton: ,
  }
}
