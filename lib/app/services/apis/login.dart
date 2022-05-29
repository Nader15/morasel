import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import '../../../base/models/login.dart';
import '../../../base/services/login.dart';
import '../../models/employee_model.dart';
import '../../utilities/constans/api.dart';

class LoginService extends BaseLoginService<BaseLoginModel> {
  var storage = GetStorage();

  Future<String> loginLocal({required username, required password}) async {
    final jsonData = await rootBundle.loadString('assets/json/login.json');
    final tokenLocal = json.decode(jsonData);
    username = 'ksalruhaymi';
    password = 'KTs74042';
    if (username == 'ksalruhaymi' && password == 'KTs74042') {
      var token = tokenLocal['token'];
      // storage.write('token', token);
      return token;
    } else {
      Get.snackbar(
        'ProblemLogin',
        'ProblemLogin'.tr,
        titleText: const Text(
          '',
          style: TextStyle(
            color: Colors.red,
            fontSize: 17,
          ),
        ),
        messageText: Text(
          'ProblemLogin'.tr,
          style: const TextStyle(
            color: Colors.red,
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
        snackPosition: SnackPosition.TOP,
        colorText: Colors.red,
        duration: const Duration(milliseconds: 1000),
        // animationDuration: const Duration(microseconds: 2000),
        icon: const Icon(
          Icons.warning,
          color: Colors.red,
          size: 30,
        ),
        backgroundColor: Colors.white,
      );
      return throw Exception('No data load');
    }
  }

  Future<String> loginApi({required username, required password}) async {
    String urlApi = '$BASEURL/authenticate';
    var client = http.Client();
    var response = await client.post(Uri.parse(urlApi),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, String>{
          "username": username,
          "password": password,
          "fbtoken": "123"
        }));

    if (response.statusCode == 200) {
      var tokenApi = jsonDecode(response.body);
      var token = tokenApi['token'];
      // storage.write('token', token);

      return token ??
          Get.snackbar(
            'ProblemLogin',
            'ProblemLogin'.tr,
            titleText: const Text(
              '',
              style: TextStyle(
                color: Colors.red,
                fontSize: 17,
              ),
            ),
            messageText: Text(
              'ProblemLogin'.tr,
              style: const TextStyle(
                color: Colors.red,
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
            snackPosition: SnackPosition.TOP,
            colorText: Colors.red,
            duration: const Duration(milliseconds: 1000),
            // animationDuration: const Duration(microseconds: 2000),
            icon: const Icon(
              Icons.warning,
              color: Colors.red,
              size: 30,
            ),
            backgroundColor: Colors.white,
          );
    } else {
      Get.snackbar(
        '',
        '',
        titleText: const Text(
          'خطأ',
          style: TextStyle(
            color: Colors.red,
            fontSize: 17,
          ),
        ),
        messageText: const Text(
          'البيانات فارغة',
          style: TextStyle(
            color: Colors.red,
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
        snackPosition: SnackPosition.TOP,
        colorText: Colors.red,
        duration: const Duration(milliseconds: 1000),
        // animationDuration: const Duration(microseconds: 2000),
        icon: const Icon(
          Icons.warning,
          color: Colors.red,
          size: 30,
        ),
        backgroundColor: Colors.white,
      );

      return throw Exception('No data load ');
    }
  }

  Future<List<Employee>> getEmployeeLocal() async {
    final jsonData = await rootBundle.loadString('assets/json/employee.json');
    //  final parsed = json.decode(jsonData);
    List jsonList = jsonDecode(jsonData);
    final List<Employee> employeeList =
        jsonList.map((value) => Employee.fromJson(value)).toList();
    return employeeList;
  }

  Future<List<Employee>> getEmployeeApi() async {
    var client = http.Client();
    var token = GetStorage().read('token');
    var username = GetStorage().read('username');
    String urlApi = '$BASEURL/employee/$username';
    var response = await client.get(
      Uri.parse(urlApi),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      },
    );

    if (response.statusCode == 200) {
      List jsonList = jsonDecode(utf8.decode(response.bodyBytes));
      final List<Employee> employeeList =
          jsonList.map((value) => Employee.fromJson(value)).toList();
      await storage.write("employeeid", employeeList[0].employeeid);

      return employeeList;
    } else {
      throw Exception('No data load $token ${response.body}');
    }
  }

  @override
  Future<List<BaseLoginModel?>> getAll() {
    throw UnimplementedError();
  }
}
