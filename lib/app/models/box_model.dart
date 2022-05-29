import '../../base/models/box.dart';
import 'sort_model.dart';
import 'content_model.dart';

class Box extends BaseBoxModel {
  List<Content> content;
  int totalPages;
  int totalElements;
  bool last;
  int number;
  int size;
  int numberOfElements;
  Sort sort;
  bool first;
  bool empty;

  Box({
    required this.content,
    required this.totalPages,
    required this.totalElements,
    required this.last,
    required this.number,
    required this.size,
    required this.numberOfElements,
    required this.sort,
    required this.first,
    required this.empty,
  });
  factory Box.fromJson(Map<String, dynamic> json) {
    var list = json['content'] as List;
    List<Content> contentList =
        list.map((content) => Content.fromJson(content)).toList();
    return Box(
      content: contentList,
      totalPages: json['totalPages'],
      totalElements: json['totalElements'],
      last: json['last'],
      number: json['number'],
      size: json['size'],
      numberOfElements: json['numberOfElements'],
      sort: Sort.fromJson(json['sort']),
      first: json['first'],
      empty: json['empty'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    throw UnimplementedError();
  }

  @override
  String toString() {
    return super.toString();
  }
}
