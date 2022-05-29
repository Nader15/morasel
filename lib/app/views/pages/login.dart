// ignore: must_be_immutable
import '../../../core/contracts/page.dart';
import '../../binding/login.dart';
import '../screens/login/login.dart';

class LoginPage extends Page {
  LoginPage()
      : super(
          name: '/login',
          screen: LoginScreen(),
          binding: LoginBindings(),
        );
}
