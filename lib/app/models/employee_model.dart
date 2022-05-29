import '../../base/models/box.dart';
import 'department_model.dart';

class Employee extends BaseBoxModel {
  int employeeid;
  int idno;
  String fullname;
  dynamic title;
  bool active;
  int permissionsmask;
  int prefrencesmask;
  int forwardtolisttype;
  dynamic mobile;
  Dpartment department;

  Employee({
    required this.employeeid,
    required this.idno,
    required this.fullname,
    required this.title,
    required this.active,
    required this.permissionsmask,
    required this.prefrencesmask,
    required this.forwardtolisttype,
    required this.mobile,
    required this.department,
  });

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      employeeid: json['employeeid'],
      idno: json['idno'],
      fullname: json['fullname'],
      title: json['title'],
      active: json['active'],
      permissionsmask: json['permissionsmask'],
      prefrencesmask: json['prefrencesmask'],
      forwardtolisttype: json['forwardtolisttype'],
      mobile: json['mobile'],
      department: Dpartment.fromJson(json['department']),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    throw UnimplementedError();
  }
}
