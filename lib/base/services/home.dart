import '../../core/contracts/service.dart';

abstract class BaseHomeService<BaseBox> extends Service {
  Future<List<BaseBox?>> getApi();
  Future<List<BaseBox?>> getLocal();
}
