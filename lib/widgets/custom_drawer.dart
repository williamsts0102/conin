import 'package:conin/routes/route.dart';
import 'package:flutter/material.dart';

class CustomDrawerWidget extends StatelessWidget {
  const CustomDrawerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/logotipo/logotipo.png',
                ),
              ),
            ),
            child: Center(),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Panel Principal'),
            onTap: () {
              Navigator.pushReplacementNamed(context, MyRoutes.rHome);
            },
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Perfil'),
            onTap: () {
              Navigator.pushReplacementNamed(context, MyRoutes.rPerfil);
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Configuracion'),
            onTap: () {
              Navigator.pushReplacementNamed(context, MyRoutes.rAjuste);
            },
          ),
          ListTile(
            leading: const Icon(Icons.help),
            title: const Text('Ayuda'),
            onTap: () {
              Navigator.pushReplacementNamed(context, MyRoutes.rAyuda);
            },
          ),
        ],
      ),
    );
  }
}
