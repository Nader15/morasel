import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:morasel/app/controllers/pdf_controller.dart';
import 'package:morasel/app/controllers/setting_controller.dart';
import 'package:morasel/app/views/components/box/box_appbar.dart';
import 'package:morasel/app/views/components/box/box_drawer.dart';
import 'package:morasel/app/views/components/pdf/pdf_data.dart';
import 'package:morasel/base/controllers/pdf.dart';
import 'package:morasel/core/contracts/screen.dart';

// ignore_for_file: must_be_immutable
class PdfScreen extends Screen<BasePdfController> {
  SettingController settingController = Get.find();
//  DetailController detailsController = Get.find();
  PdfController pdfController = Get.put(PdfController());

  PdfScreen() : super();

  @override
  Widget? desktop() {
    return Directionality(
      textDirection: settingController.selectiedLang.value == 'en'
          ? TextDirection.ltr
          : TextDirection.rtl,
      child: SafeArea(
        child: Scaffold(
          body: Row(
            children: [
              Container(),
              const Card(
                child: Text('data'),
                elevation: 5,
              ),
              ElevatedButton(
                child: const Text('Close'),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget? tablet() {
    return Column(
      children: const [
        Text('ok'),
      ],
    );
  }

  @override
  Widget? phone() {
    return Directionality(
        textDirection: settingController.selectiedLang.value == 'en'
            ? TextDirection.ltr
            : TextDirection.rtl,
        child: SafeArea(
          child: Scaffold(
              appBar: BoxAppBar(
                title: 'Box'.tr + ' ' + 'Transactions'.tr,
              ),
              drawer: BoxDrawer(),
              body: PdfData(pdfController.assetPDFPath)),
        ));
  }
}

//SfPdfViewer.network('https://www.ssa.gov/forms/ss-5.pdf',key: _pdfViewerKey)


 //Center(
   //         child: ElevatedButton(
     //         child: const Text('Press'),
       //       onPressed: () {
         //       Get.to(() => DetailScreen());
           //   },
         //   ),
         // ),