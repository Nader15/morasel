import 'dart:convert';
import '../../base/models/login.dart';

UserLogin userFromJson(String str) => UserLogin.toObject(json.decode(str));

class UserLogin extends BaseLoginModel {
  LoginModel user;
  late String fbtoken;

  UserLogin({
    required this.user,
    required this.fbtoken,
  });

  factory UserLogin.toObject(Map<String, dynamic> json) => UserLogin(
      user: LoginModel.fromJson(json['user']), fbtoken: json['token']);
  @override
  Map<String, dynamic> toJson() => {
        'user': user.toJson(),
        'fbtoken': fbtoken,
      };
}

class LoginModel extends BaseLoginModel {
  late String username;
  late String password;
  late String fbtoken;

  LoginModel({
    required this.username,
    required this.password,
    required this.fbtoken,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
      username: json['username'],
      password: json['password'],
      fbtoken: json['fbtoken']);

  @override
  Map<String, dynamic> toJson() => {
        'username': username,
        'password': password,
        'fbtoken': fbtoken,
      };
}
