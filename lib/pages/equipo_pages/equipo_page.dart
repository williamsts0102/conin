import 'package:flutter/material.dart';

class EquipoPageConin extends StatelessWidget {
  const EquipoPageConin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Información de equipo',
          ),
          centerTitle: true,
        ),
        body: Container(
          padding: const EdgeInsets.all(15),
          child: ListView(
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                  color: Colors.indigo,
                ),
                child: const ListTile(
                  title: Text(
                    'Toro Susanibar, Williams',
                    style: TextStyle(fontSize: 20),
                  ),
                  subtitle: Text('Cargo: Jefe\nTelefono: +51 987 654 321'),
                  leading: Icon(
                    Icons.stars,
                    size: 30,
                  ),
                  iconColor: Colors.white,
                  textColor: Colors.white,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                  color: Colors.blue,
                ),
                child: const ListTile(
                  title: Text(
                    'Rojas de la Cruz, Melanie Emilia',
                    style: TextStyle(fontSize: 20),
                  ),
                  subtitle: Text('Cargo: Personal\nTelefono: +51 987 654 321'),
                  leading: Icon(
                    Icons.stars,
                    size: 30,
                  ),
                  iconColor: Colors.white,
                  textColor: Colors.white,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                  color: Colors.deepOrange,
                ),
                child: const ListTile(
                  title: Text(
                    'Saico Yucra, Alexander',
                    style: TextStyle(fontSize: 20),
                  ),
                  subtitle: Text('Cargo: Personal\nTelefono: +51 987 654 321'),
                  leading: Icon(
                    Icons.stars,
                    size: 30,
                  ),
                  iconColor: Colors.white,
                  textColor: Colors.white,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                  color: Colors.green,
                ),
                child: const ListTile(
                  title: Text(
                    'Valladolid Florindez, Percy',
                    style: TextStyle(fontSize: 20),
                  ),
                  subtitle: Text('Cargo: Personal\nTelefono: +51 987 654 321'),
                  leading: Icon(
                    Icons.stars,
                    size: 30,
                  ),
                  iconColor: Colors.white,
                  textColor: Colors.white,
                ),
              ),
            ],
          ),
        ));
  }
}
