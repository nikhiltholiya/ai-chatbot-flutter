import 'package:flutter/material.dart';
import 'package:gptsample/screen/dashboard_desktop.dart';
import 'package:gptsample/screen/dashboard_mobile.dart';
import 'package:gptsample/utils/responsive_checker.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ResponsiveChecker.isDesktop(context)
          ? const DashboardDesktop()
          : const DashboardMobile(),
    );
  }
}
