import 'package:flutter/material.dart';
import 'package:gptsample/screen/_chatbot/_chatbot.dart';
import 'package:gptsample/screen/auth/login.dart';
import 'package:gptsample/screen/dashboard_screen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'AI Secretary',
        initialRoute: '/home',
        debugShowCheckedModeBanner: false,
        routes: {
          '/login': (context) => const LoginView(),
          '/botui': (context) => const tempAibot(),
          '/home': (context) => const DashboardScreen(),
        },
      ),
    );
  }
}
