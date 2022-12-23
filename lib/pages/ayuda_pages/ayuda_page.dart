import 'package:conin/widgets/index_widgets.dart';
import 'package:flutter/material.dart';

class AyudaPageConin extends StatelessWidget {
  const AyudaPageConin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ayuda'),
        centerTitle: true,
      ),
      drawer: const CustomDrawerWidget(),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
            child: const ListTile(
              title: Text('¿Necesitas Ayuda?'),
              leading: Icon(
                Icons.help,
                color: Colors.blue,
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 27,
                color: Colors.blue,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
            child: const ListTile(
              title: Text('Uso de la aplicación'),
              leading: Icon(
                Icons.help,
                color: Colors.blue,
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 27,
                color: Colors.blue,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
            child: const ListTile(
              title: Text('Reportar Algun Problema'),
              leading: Icon(
                Icons.help,
                color: Colors.blue,
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 27,
                color: Colors.blue,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
            child: const ListTile(
              title: Text('Contactanos'),
              subtitle: Text('+51949894654'),
              leading: Icon(
                Icons.help,
                color: Colors.blue,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
            child: const ListTile(
              title: Text('WhatSapp'),
              subtitle: Text('+51949894654'),
              leading: Icon(
                Icons.help,
                color: Colors.blue,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
