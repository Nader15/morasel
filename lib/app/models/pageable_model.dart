import 'package:morasel/base/models/box.dart';

import 'sort_model.dart';

class Pageable extends BaseBoxModel {
  late Sort sort;
  late int pageSize;
  late int pageNumber;
  late int offset;
  late bool paged;
  late bool unpaged;

  Pageable({
    required this.sort,
    required this.pageSize,
    required this.pageNumber,
    required this.offset,
    required this.paged,
    required this.unpaged,
  });
  Pageable.fromJson(Map<String, dynamic> json) {
    sort = json['sort'];
    pageSize = json['pageSize'];
    pageNumber = json['pageNumber'];
    offset = json['offset'];
    paged = json['paged'];
    unpaged = json['unpaged'];
  }

  @override
  Map<String, dynamic> toJson() {
    throw UnimplementedError();
  }
}
