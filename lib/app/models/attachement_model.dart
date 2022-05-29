import '../../base/models/detail.dart';

class Attachement extends BaseDetailModel {
  String objectid;
  int corsid;
  int corstype;
  int corsno;
  int hijricyear;
  String subject;
  String mimetype;
  String hijridatecreated;
  String filenetcreateddate;
  String creator;

  Attachement({
    required this.objectid,
    required this.corsid,
    required this.corstype,
    required this.corsno,
    required this.hijricyear,
    required this.subject,
    required this.mimetype,
    required this.hijridatecreated,
    required this.filenetcreateddate,
    required this.creator,
  });

  factory Attachement.fromJson(Map<String, dynamic> json) {
    return Attachement(
      objectid: json['objectid'],
      corsid: json['corsid'],
      corstype: json['corstype'],
      corsno: json['corsno'],
      hijricyear: json['hijricyear'],
      subject: json['subject'],
      mimetype: json['mimetype'],
      hijridatecreated: json['hijridatecreated'],
      filenetcreateddate: json['filenetcreateddate'],
      creator: json['creator'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    throw UnimplementedError();
  }
}
