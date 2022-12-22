import 'package:conin/pages/index.dart';
import 'package:flutter/material.dart';

class MyRoutes {
  static const String rLogin = '/login';
  static const String rHome = '/home';
  static const String rPerfil = '/perfil';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case ('/login'):
        return MaterialPageRoute(builder: (_) => const LoginPageConin());
      case ('/home'):
        return MaterialPageRoute(builder: (_) => const HomePageConin());
      case ('/perfil'):
        return MaterialPageRoute(builder: (_) => const MyPerfilConin());
      default:
        return MaterialPageRoute(builder: (_) => const LoginPageConin());
    }
  }
}
