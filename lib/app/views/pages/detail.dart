// ignore: must_be_immutable
import '../../../core/contracts/page.dart';
import '../../binding/detail.dart';
import '../screens/detail/detail.dart';

class DetailPage extends Page {
  DetailPage()
      : super(
          name: '/detail',
          screen: DetailScreen(),
          binding: DetailBindings(),
        );
}
