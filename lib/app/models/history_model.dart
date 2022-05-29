import 'package:morasel/app/models/send_model.dart';

import '../../base/models/detail.dart';

class History extends BaseDetailModel {
  List<Send> send;
  int translogid;
  int corsid;
  int fromparticipanttype;
  int fromemployeeid;
  int fromdepartmentid;
  dynamic instructions;
  int transtype;
  String transdatetime;
  String fromemployeename;
  String fromdepartmentname;
  String transdatetimef;

  History({
    required this.send,
    required this.translogid,
    required this.corsid,
    required this.fromparticipanttype,
    required this.fromemployeeid,
    required this.fromdepartmentid,
    required this.instructions,
    required this.transtype,
    required this.transdatetime,
    required this.fromemployeename,
    required this.fromdepartmentname,
    required this.transdatetimef,
  });
  
  factory History.fromJson(Map<String, dynamic> json) {
    var list = json['sendTo'] as List;
    List<Send> sendToList =
        list.map((sendto) => Send.fromJson(sendto)).toList();
    return History(
      send: sendToList,
      translogid: json['translogid'],
      corsid: json['corsid'],
      fromparticipanttype: json['fromparticipanttype'],
      fromemployeeid: json['fromemployeeid'],
      fromdepartmentid: json['fromdepartmentid'],
      instructions: json['instructions'],
      transtype: json['transtype'],
      transdatetime: json['transdatetime'],
      fromemployeename: json['fromemployeename'],
      fromdepartmentname: json['fromdepartmentname'],
      transdatetimef: json['transdatetimef'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    throw UnimplementedError();
  }
}
