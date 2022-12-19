import 'package:conin/pages/index.dart';
import 'package:flutter/material.dart';

class MyRoutes {
  static const String rLogin = '/login';
  static const String rHome = '/home';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case ('/login'):
        return MaterialPageRoute(builder: (_) => const LoginPageConin());
      case ('/home'):
        return MaterialPageRoute(builder: (_) => const HomePageConin());
      default:
        return MaterialPageRoute(builder: (_) => const LoginPageConin());
    }
  }
}
