import '../../base/models/detail.dart';

class Send extends BaseDetailModel {
  int translogdetailid;
  int transdetailtype;
  int participantemployeeid;
  int participanttype;
  String participantemployeename;
  String participantdepartmentname;
  String deadlinestatus;
  int completetranslogid;

  Send({
    required this.translogdetailid,
    required this.transdetailtype,
    required this.participantemployeeid,
    required this.participanttype,
    required this.participantemployeename,
    required this.participantdepartmentname,
    required this.deadlinestatus,
    required this.completetranslogid,
  });
  factory Send.fromJson(Map<String, dynamic> json) {
    return Send(
      translogdetailid: json['translogdetailid'],
      transdetailtype: json['transdetailtype'],
      participantemployeeid: json['participantemployeeid'],
      participanttype: json['participanttype'],
      participantemployeename: json['participantemployeename'],
      participantdepartmentname: json['participantdepartmentname'],
      deadlinestatus: json['deadlinestatus'],
      completetranslogid: json['completetranslogid'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    throw UnimplementedError();
  }
}
