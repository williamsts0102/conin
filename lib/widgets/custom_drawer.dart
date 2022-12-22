import 'package:conin/routes/route.dart';
import 'package:flutter/material.dart';

class CustomDrawerWidget extends StatelessWidget {
  const CustomDrawerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(
                  'https://cdn.pixabay.com/photo/2020/02/08/00/32/icon-4828765_960_720.jpg',
                ),
              ),
            ),
            child: Center(
              child: Text(
                'CONIN',
                style: TextStyle(
                  fontSize: 26,
                  color: Colors.white,
                ),
              ),
            ),
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
          // ListTile(
          //   leading: const Icon(Icons.settings),
          //   title: const Text('Configuracion'),
          //   onTap: () {
          //     Navigator.pushReplacementNamed(context, MyRoutes.rAjuste);
          //   },
          // ),
        ],
      ),
    );
  }
}
