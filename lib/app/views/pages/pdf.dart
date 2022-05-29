// ignore: must_be_immutable
import 'package:morasel/app/binding/pdf.dart';
import 'package:morasel/app/views/screens/pdf/pdf.dart';

import '../../../core/contracts/page.dart';

class PdfPage extends Page {
  PdfPage()
      : super(
          name: '/login',
          screen: PdfScreen(),
          binding: PdfBindings(),
        );
}
