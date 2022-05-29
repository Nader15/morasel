import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:morasel/app/models/participant_model.dart';
import '../../../base/models/detail.dart';
import '../../../base/services/detail.dart';
import '../../utilities/constans/api.dart';

class ParticipantService extends BaseDetailService<BaseDetailModel> {
  Future<List<ParticipantModel>> getLocal() async {
    final jsonData =
        await rootBundle.loadString('assets/json/participant.json');
    final parsed = json.decode(jsonData);
    final List<ParticipantModel> prticipantList = parsed
        .map<ParticipantModel>((value) => ParticipantModel.fromJson(value))
        .toList();

    return prticipantList;
  }

  Future<List<ParticipantModel>> getApi() async {
    var client = http.Client();
    var token = GetStorage().read('token');
    // ignore: unused_local_variable
    var username = GetStorage().read('username');
    String urlApi = '$BASEURL/participants/3/2980';
    //  /participants/{departmentId}/{employeeId}

    var response = await client.get(
      Uri.parse(urlApi),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      },
    );
    if (response.statusCode == 200) {
      final parsed = jsonDecode(utf8.decode(response.bodyBytes));
      final List<ParticipantModel> prticipantList = parsed
          .map<ParticipantModel>((value) => ParticipantModel.fromJson(value))
          .toList();
      print(prticipantList);

      return prticipantList;
    } else {
      throw Exception('No data load $token');
    }
  }

  @override
  Future<List<BaseDetailModel?>> getAll() {
    throw UnimplementedError();
  }
}
