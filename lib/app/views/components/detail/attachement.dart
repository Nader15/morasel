import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/detail_controller.dart';
import '../../../models/attachement_model.dart';

//crosGet
class AttachmentList extends GetView<DetailController> {
  AttachmentList({Key? key}) : super(key: key);
  final TextEditingController textSearch = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Attachement>>(
        future: controller.attachementService.getLocal(Get.arguments),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('${snapshot.error}');
          } else if (snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (BuildContext context, int index) {
                    var item = snapshot.data;
                    return InkWell(
                        child: ListTile(
                          leading: Image.asset(
                            "assets/images/pdf.png",
                            width: 35,
                            height: 35,
                          ),
                          title: Text(
                            item![index].subject,
                            // style: Themes().bodyStyle5,
                          ),
                          subtitle: Text(
                            item[index].creator,
                            //    style: Themes().bodyStyle5,
                          ),
                          trailing: Text(
                            item[index].hijridatecreated,
                            //   style: Themes().bodyStyle5,
                          ),
                        ),
                        onTap: () async {
                          // controller.getByets();
                          // var md = controller.getByets();
                          // var name = const Utf8Codec().encode(md);
                          // Get.to(() => PdfScreen(), arguments: name);
                          // print(controller.getByets());
                          // SfPdfViewer.memory(controller.getByets());

                          // var id = 'http://imamae:9080/mmobile/docs/view/' +
                          item[index].objectid;
                          //  print(await controller.pdf());
                          var x = controller.pdf().asUint8List;

                          // final buffer = x.buffer;
                          // x = buffer.asUint8List(
                          //     x.offsetInBytes, x.lengthInBytes);
                          print(x);
                          // Get.to(() => PdfScreen(), arguments: x);

                          // print('http://imamae:9080/mmobile/docs/view/' +
                          //     item[index].objectid);
                        });
                  }),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
