import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:morasel/base/services/detail.dart';
import '../../../base/models/detail.dart';
import '../../models/attachement_model.dart';
import '../../utilities/constans/api.dart';

class AttachementService extends BaseDetailService<BaseDetailModel> {
  Future<List<Attachement>> getLocal(number) async {
    final jsonData =
        await rootBundle.loadString('assets/json/attachement.json');

    if (jsonData.isNotEmpty) {
      final listBox = jsonDecode(jsonData);

      List<Attachement> list = [];
      for (var item in listBox) {
        list.add(Attachement.fromJson(item));
      }
      return list;
    } else {
      throw Exception('No data load');
    }
  }

  Future<List<Attachement>> getApi(number) async {
    var client = http.Client();
    var token = GetStorage().read('token');
    String urlApi = '$BASEURL/attachements/$number';

    var response = await client.get(
      Uri.parse(urlApi),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      },
    );
    if (response.statusCode == 200) {
      final listBox = jsonDecode(utf8.decode(response.bodyBytes));
      List<Attachement> list = [];
      for (var item in listBox) {
        list.add(Attachement.fromJson(item));
      }
      return list;
    } else {
      throw Exception('No data load $token');
    }
  }

  Future getApiAttch() async {
    var client = http.Client();
    var token = GetStorage().read('token');
    String urlApi =
        'http://imamae:9080/mmobile/docs/view/50DB727F-0000-C41C-BD6E-5EAB69FC322A';

    var response = await client.get(
      Uri.parse(urlApi),
      headers: {
        //'Content-Type': 'application/json',
        'Content-Type': 'application/octet-stream',
        'Authorization': 'Bearer $token'
      },
    );

    if (response.statusCode == 200) {
      //  final listBox = response.body;
      // print(response.bodyBytes);

      return (response.body);
    } else {
      throw Exception('No data load ');
    }
  }

  @override
  Future<List<BaseDetailModel?>> getAll() {
    throw UnimplementedError();
  }
}
