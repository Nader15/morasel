import '../../core/contracts/service.dart';

abstract class BaseBoxService<BaseBox> extends Service {
  Future<List<BaseBox?>> getAll();
}
