import 'package:conin/widgets/card_widget.dart';
import 'package:flutter/material.dart';

class InventarioPageConin extends StatelessWidget {
  const InventarioPageConin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inventario'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.add,
              color: Colors.blue,
              size: 45,
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          const Text(
            'Abarrotes',
            style: TextStyle(fontSize: 35),
          ),
          CardCustom(
            leading: Image.network(
                'https://mercury.vteximg.com.br/arquivos/ids/6378372-3000-3000/image-a51dc2569d5f4e879833137aaebfe692.jpg?v=637835842665300000'),
            title: const Text('Arroz Extra COSTEÑO\nBolsa 5Kg'),
            subtitle: const Text(
                'Cantidad: 10\nPrecio de Compra: S/ 15.50\nPrecio de Venta: S/ 20.5'),
            onPressedActualizar: () {},
            onPressedBorrar: () {},
            onPressedVer: () {
              Navigator.pushNamed(context, '/vermasinventario');
            },
          ),
        ],
      ),
    );
  }
}
