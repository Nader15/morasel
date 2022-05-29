import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:morasel/app/models/content_model.dart';
import '../../../base/models/box.dart';
import '../../../base/services/box.dart';
import '../../models/box_model.dart';
import '../../utilities/constans/api.dart';

class BoxService extends BaseBoxService<BaseBoxModel> {
  Future<List<Content>> getLocal() async {
    final jsonData = await rootBundle.loadString('assets/json/box.json');
    final parsed = json.decode(jsonData);
    var boxList = Box.fromJson(parsed);
    return boxList.content;
  }

  Future<List<Content>> getApi() async {
    var client = http.Client();
    var token = GetStorage().read('token');
    var username = GetStorage().read('username');
    String urlApi = '$BASEURL/correspondence/$username';

    var response = await client.get(
      Uri.parse(urlApi),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      },
    );

    if (response.statusCode == 200) {
      final listBox = jsonDecode(utf8.decode(response.bodyBytes));
      var boxList = Box.fromJson(listBox);

      //   List jsonList = jsonDecode(response.body);
      //   final List<Content> content =
      //      jsonList.map((value) => Content.fromJson(value)).toList();
      return boxList.content;
    } else {
      throw Exception('No data load $token ${response.statusCode}');
    }
  }

  @override
  Future<List<BaseBoxModel?>> getAll() {
    throw UnimplementedError();
  }
}
