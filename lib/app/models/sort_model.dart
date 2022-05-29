import '../../base/models/box.dart';

class Sort extends BaseBoxModel {
  late bool sorted;
  late bool unsorted;
  late bool empty;

  Sort({
    required this.sorted,
    required this.unsorted,
    required this.empty,
  });
  Sort.fromJson(Map<String, dynamic> json) {
    sorted = json['sorted'];
    unsorted = json['unsorted'];
    empty = json['empty'];
  }

  @override
  Map<String, dynamic> toJson() {
    throw UnimplementedError();
  }
}
