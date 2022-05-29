import 'dart:convert';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import '../../../base/models/login.dart';
import '../../../base/services/login.dart';
import '../../utilities/constans/api.dart';

class ActionService extends BaseLoginService<BaseLoginModel> {
  Future<bool> actionApi({
    required selectedResponse,
    required lstTOParticipants,
    required lstCCParticipants,
    required corrType,
    required stepType,
    required importance,
    required urgencyLevelParam,
    required followup,
    required instructions,
    required corr,
    required employeeid,
    required queuename,
  }) async {
    String urlApi = '$BASEURL/send';
    var client = http.Client();
    var token = GetStorage().read('token');
    var response = await client.post(Uri.parse(urlApi),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'
        },
        body: jsonEncode(<String, dynamic>{
          "selectedResponse": selectedResponse,
          "lstTOParticipants": lstTOParticipants,
          "lstCCParticipants": lstCCParticipants,
          "corrType": corrType,
          "stepType": stepType,
          "importance": importance,
          "urgencyLevelParam": urgencyLevelParam,
          "followup": followup,
          "instructions": instructions!,
          "corr": corr,
          "employeeid": employeeid,
          "queuename": queuename,
        }));
    // ignore: avoid_print
    print(response.body);

    if (response.statusCode == 200) {
      print(response.body);

      return true;
    } else {
      throw Exception('No data load $token ${response.statusCode}');
    }
  }

  Future<bool> actionLocal({
    required selectedResponse,
    required lstTOParticipants,
    required lstCCParticipants,
    required corrType,
    required stepType,
    required importance,
    required urgencyLevelParam,
    required followup,
    required instructions,
    required corr,
    required employeeid,
    required queuename,
  }) async {
    // print(lstTOParticipants);
    // print(corr);

    var object = jsonEncode(<String, dynamic>{
      "selectedResponse": selectedResponse,
      "lstTOParticipants": lstTOParticipants,
      "lstCCParticipants": lstCCParticipants,
      "corrType": corrType,
      "stepType": stepType,
      "importance": importance,
      "urgencyLevelParam": urgencyLevelParam,
      "followup": followup,
      "instructions": instructions!,
      "corr": corr,
      "employeeid": employeeid,
      "queuename": queuename
    });
    print(object);

    return true;
  }

  Future<bool> actionLocal2(Map<String, dynamic> data) async {
    // print(lstTOParticipants);
    // print(corr);

    var object = jsonEncode(data);
    print(object);

    return true;
  }

  Future<bool> isReadApi({
    required wobnum,
    required queuename,
  }) async {
    String urlApi = '$BASEURL/updateIsRead/$wobnum/$queuename';
    var client = http.Client();
    var token = GetStorage().read('token');
    var response = await client.get(
      Uri.parse(urlApi),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      },
    );

    print(response.body);

    return true;
  }

  Future<bool> isReadlocal({
    required wobnum,
    required queuename,
  }) async {
    var object = jsonEncode(
        <String, dynamic>{"employeeid": wobnum, "queuename": queuename});
    print(object);
    return true;
  }

  @override
  Future<List<BaseLoginModel?>> getAll() {
    throw UnimplementedError();
  }
}
