import 'package:conin/providers/provider_cart.dart';
import 'package:conin/providers/provider_inventario.dart';
import 'package:conin/routes/route.dart';
import 'package:conin/services/service_categoria.dart';
import 'package:conin/services/service_equipo.dart';
import 'package:conin/services/service_login.dart';
import 'package:conin/services/service_producto.dart';
import 'package:conin/services/service_venta.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:conin/providers/provider_login.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (_) => ProviderLogin(),
      ),
      ChangeNotifierProvider(
        create: (_) => LoginConinService(),
      ),
      ChangeNotifierProvider(
        create: (_) => CategoriaService(),
      ),
      ChangeNotifierProvider(
        create: (_) => ProductoService(),
      ),
      ChangeNotifierProvider(
        create: (_) => InventarioProvider(),
      ),
      ChangeNotifierProvider(
        create: (_) => EquipoService(),
      ),
      ChangeNotifierProvider(
        create: (_) => CartProvider(),
      ),
      ChangeNotifierProvider(
        create: (_) => VentaConinService(),
      ),
    ], child: const MyApp()),
  ); // runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Conin Demo',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: MyRoutes.generateRoute,
      initialRoute: MyRoutes.rLogin,
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
