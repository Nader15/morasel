import '../../core/contracts/service.dart';

abstract class BaseDetailService<BaseBox> extends Service {
  Future<List<BaseBox?>> getAll();
}
