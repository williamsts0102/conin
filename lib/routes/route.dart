import 'package:conin/pages/index.dart';
import 'package:flutter/material.dart';

class MyRoutes {
  static const String rLogin = '/login';
  static const String rHome = '/home';
  static const String rPerfil = '/perfil';
  static const String rInventario = '/inventario';
  static const String rEquipo = '/equipo';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case ('/login'):
        return MaterialPageRoute(builder: (_) => const LoginPageConin());
      case ('/home'):
        return MaterialPageRoute(builder: (_) => const HomePageConin());
      case ('/perfil'):
        return MaterialPageRoute(builder: (_) => const MyPerfilConin());
      case ('/inventario'):
        return MaterialPageRoute(builder: (_) => const InventarioPageConin());
      case ('/equipo'):
        return MaterialPageRoute(builder: (_) => const EquipoPageConin());
      default:
        return MaterialPageRoute(builder: (_) => const LoginPageConin());
    }
  }
}
