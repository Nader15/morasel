import '../../core/contracts/service.dart';

abstract class BaseLoginService<BaseLogin> extends Service {
  Future<List<BaseLogin?>> getAll();
}
