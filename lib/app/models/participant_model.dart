import 'package:morasel/base/models/box.dart';

class ParticipantModel extends BaseBoxModel {
  int participantEmployeeId;
  int participantDepartmentId;
  int participantType;
  String participantName;
  String participantUserId;
  int parentDepartmentId;
  int participantCommitteeId;
  int participantPrefrencesMask;
  dynamic participantMobileNumber;

  ParticipantModel({
    required this.participantEmployeeId,
    required this.participantDepartmentId,
    required this.participantType,
    required this.participantName,
    required this.participantUserId,
    required this.parentDepartmentId,
    required this.participantCommitteeId,
    required this.participantPrefrencesMask,
    required this.participantMobileNumber,
  });

  factory ParticipantModel.fromJson(Map<String, dynamic> json) {
    return ParticipantModel(
      participantEmployeeId: json['participantEmployeeId'],
      participantDepartmentId: json['participantDepartmentId'],
      participantType: json['participantType'],
      participantName: json['participantName'],
      participantUserId: json['participantUserId'],
      parentDepartmentId: json['parentDepartmentId'],
      participantCommitteeId: json['participantCommitteeId'],
      participantPrefrencesMask: json['participantPrefrencesMask'],
      participantMobileNumber: json['participantMobileNumber'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    throw UnimplementedError();
  }
}
