import 'package:conin/pages/index.dart';
import 'package:flutter/material.dart';

class MyRoutes {
  static const String rLogin = '/login';
  static const String rRegister = '/register';
  static const String rHome = '/home';
  static const String rPerfil = '/perfil';
  static const String rAjuste = '/ajuste';
  static const String rAyuda = '/ayuda';
  static const String rInventario = '/inventario';
  static const String rVerMasInventario = '/vermasinventario';
  static const String rEquipo = '/equipo';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case ('/login'):
        return MaterialPageRoute(builder: (_) => const LoginPageConin());
      case ('/register'):
        return MaterialPageRoute(builder: (_) => const RegisterPageConin());
      case ('/home'):
        return MaterialPageRoute(builder: (_) => const HomePageConin());
      case ('/perfil'):
        return MaterialPageRoute(builder: (_) => const MyPerfilConin());
      case ('/ajuste'):
        return MaterialPageRoute(builder: (_) => const AjustePageConin());
      case ('/ayuda'):
        return MaterialPageRoute(builder: (_) => const AyudaPageConin());
      case ('/inventario'):
        return MaterialPageRoute(builder: (_) => const InventarioPageConin());
      case ('/vermasinventario'):
        return MaterialPageRoute(builder: (_) => const VerMasInventarioConin());
      case ('/equipo'):
        return MaterialPageRoute(builder: (_) => const EquipoPageConin());
      default:
        return MaterialPageRoute(builder: (_) => const LoginPageConin());
    }
  }
}
