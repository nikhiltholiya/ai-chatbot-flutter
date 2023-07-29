import 'package:flutter/cupertino.dart';

class ResponsiveChecker {
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 650;
  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < 1300 &&
      MediaQuery.of(context).size.width >= 650;
  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1300;
}
