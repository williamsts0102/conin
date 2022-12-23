import 'package:flutter/material.dart';
import 'package:conin/widgets/custom_drawer.dart';

class MyPerfilConin extends StatelessWidget {
  const MyPerfilConin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mi Perfil'),
        centerTitle: true,
      ),
      drawer: const CustomDrawerWidget(),
      body: Center(
        child: Column(
          children: const [
            SizedBox(height: 20),
            CircleAvatar(
              radius: 80,
              backgroundImage: NetworkImage(
                  'https://cdn.pixabay.com/photo/2016/08/22/22/22/cat-1613086_960_720.jpg'),
            ),
            SizedBox(height: 15),
            Text(
              'Nombre:',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              'Williams Toro Susanibar',
              style: TextStyle(fontSize: 25),
            ),
            SizedBox(height: 15),
            Text(
              'Correo:',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              'williamsts0102@gmail.com',
              style: TextStyle(fontSize: 25),
            ),
            SizedBox(height: 15),
            Text(
              'Telefono:',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              '917487057',
              style: TextStyle(fontSize: 25),
            ),
            SizedBox(height: 15),
            Text(
              'Equipo:',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              'Equipo 7',
              style: TextStyle(fontSize: 25),
            ),
            SizedBox(height: 15),
            Text(
              'Cargo:',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              'Jefe',
              style: TextStyle(fontSize: 25),
            ),
          ],
        ),
      ),
    );
  }
}
