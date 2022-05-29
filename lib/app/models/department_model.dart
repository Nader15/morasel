import '../../base/models/box.dart';

class Dpartment extends BaseBoxModel {
  int departmentid;
  String departmentcode;
  String departmentname;
  int departmentlevel;
  bool active;
  dynamic queuename;
  dynamic queuedesc;
  int parentdepartmentid;
  int manageremployeeid;
  int hidden;

  Dpartment({
    required this.departmentid,
    required this.departmentcode,
    required this.departmentname,
    required this.departmentlevel,
    required this.active,
    required this.queuename,
    required this.queuedesc,
    required this.parentdepartmentid,
    required this.manageremployeeid,
    required this.hidden,
  });

  factory Dpartment.fromJson(Map<String, dynamic> json) {
    return Dpartment(
      departmentid: json['departmentid'],
      departmentcode: json['departmentcode'],
      departmentname: json['departmentname'],
      departmentlevel: json['departmentlevel'],
      active: json['active'],
      queuename: json['queuename'],
      queuedesc: json['queuedesc'],
      parentdepartmentid: json['parentdepartmentid'],
      manageremployeeid: json['manageremployeeid'],
      hidden: json['hidden'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    throw UnimplementedError();
  }
}
