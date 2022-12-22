import 'package:conin/routes/route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:conin/providers/provider_login.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (_) => ProviderLogin(),
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
