import '../../base/models/box.dart';

class Content extends BaseBoxModel {
  int corsid;
  int urgencylevel;
  int importancelevel;
  String creatordeptname;
  String creatorname;
  String receivedonhijridate;
  String correspondencedate;
  String correspondencetype;
  int hijricyear;
  String correspondencesubject;
  int correspondencenumber;
  String fullname;
  String userid;
  String departmentname;
  String wobnum;
  int isread;
  int steptype;
  String attachments;

  Content({
    required this.corsid,
    required this.urgencylevel,
    required this.importancelevel,
    required this.creatordeptname,
    required this.creatorname,
    required this.receivedonhijridate,
    required this.correspondencedate,
    required this.correspondencetype,
    required this.hijricyear,
    required this.correspondencesubject,
    required this.correspondencenumber,
    required this.fullname,
    required this.userid,
    required this.departmentname,
    required this.wobnum,
    required this.isread,
    required this.steptype,
    required this.attachments,
  });

  factory Content.fromJson(Map<String, dynamic> json) {
    return Content(
      corsid: json['corsid'],
      urgencylevel: json['urgencylevel'],
      importancelevel: json['importancelevel'],
      creatordeptname: json['creatordeptname'],
      creatorname: json['creatorname'],
      receivedonhijridate: json['receivedonhijridate'],
      correspondencedate: json['correspondencedate'],
      correspondencetype: json['correspondencetype'],
      hijricyear: json['hijricyear'],
      correspondencesubject: json['correspondencesubject'],
      correspondencenumber: json['correspondencenumber'],
      fullname: json['fullname'],
      userid: json['userid'],
      departmentname: json['departmentname'],
      wobnum: json['wobnum'],
      isread: json['isread'],
      steptype: json['steptype'],
      attachments: json['attachments'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    throw UnimplementedError();
  }

  @override
  String toString() {
    return ("$correspondencenumber");
  }
}
