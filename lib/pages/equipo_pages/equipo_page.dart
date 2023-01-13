import 'package:flutter/material.dart';
import 'package:conin/services/service_equipo.dart';
import 'package:provider/provider.dart';

class EquipoPageConin extends StatelessWidget {
  const EquipoPageConin({super.key});

  @override
  Widget build(BuildContext context) {
    final equipoService = Provider.of<EquipoService>(context);

    if (equipoService.isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(
            equipoService.usuarios[0].codequipo,
          ),
          centerTitle: true,
        ),
        body: Container(
          padding: const EdgeInsets.all(15),
          child: ListView.builder(
            itemCount: equipoService.usuarios.length,
            itemBuilder: (BuildContext context, int index) {
              final usu = equipoService.usuarios[index];
              return Container(
                margin: const EdgeInsets.only(bottom: 20),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                  color: Colors.indigo,
                ),
                child: ListTile(
                  title: Text(
                    usu.nombreu,
                    style: const TextStyle(fontSize: 20),
                  ),
                  subtitle: Text(
                      'Cargo: ${usu.codcargo}\nCorreo: ${usu.correou}\nTelefono: +51 ${usu.telefonou}'),
                  leading: const Icon(
                    Icons.stars,
                    size: 30,
                  ),
                  iconColor: Colors.white,
                  textColor: Colors.white,
                ),
              );
            },
          ),
        ));
  }
}
