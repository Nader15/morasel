// ignore: must_be_immutable
import '../../../core/contracts/page.dart';
import '../../binding/box.dart';
import '../screens/box/box.dart';

class BoxPage extends Page {
  BoxPage()
      : super(
          name: '/box',
          screen: BoxScreen(),
          binding: BoxBindings(),
        );
}
