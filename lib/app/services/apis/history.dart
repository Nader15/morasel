import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:morasel/app/models/history_model.dart';
import 'package:morasel/base/services/detail.dart';
import '../../../base/models/detail.dart';
import '../../utilities/constans/api.dart';

class HistoryService extends BaseDetailService<BaseDetailModel> {
  Future<List<History>> getLocal(number) async {
    final jsonData = await rootBundle.loadString('assets/json/history.json');

    if (jsonData.isNotEmpty) {
      final listBox = jsonDecode(jsonData);

      List<History> list = [];
      for (var item in listBox) {
        list.add(History.fromJson(item));
      }
      return list;
    } else {
      throw Exception('No data load');
    }
  }

  Future<List<History>> getApi(number) async {
    var client = http.Client();
    var token = GetStorage().read('token');
    String urlApi = '$BASEURL/history/$number';

    var response = await client.get(
      Uri.parse(urlApi),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      },
    );
    if (response.statusCode == 200) {
      final listBox = jsonDecode(utf8.decode(response.bodyBytes));
      List<History> list = [];
      for (var item in listBox) {
        list.add(History.fromJson(item));
      }
      return list;
    } else {
      throw Exception('No data load $token');
    }
  }

  @override
  Future<List<BaseDetailModel?>> getAll() {
    throw UnimplementedError();
  }
}
