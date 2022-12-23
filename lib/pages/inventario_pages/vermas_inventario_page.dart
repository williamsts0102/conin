import 'package:flutter/material.dart';

class VerMasInventarioConin extends StatelessWidget {
  const VerMasInventarioConin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Abarrotes'),
      ),
      body: Center(
        child: Column(
          children: [
            const Text(
              'Arroz Extra COSTEÑO',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox.fromSize(
              size: const Size.fromRadius(100),
              child: Image.network(
                  'https://mercury.vteximg.com.br/arquivos/ids/6378372-3000-3000/image-a51dc2569d5f4e879833137aaebfe692.jpg?v=637835842665300000'),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              'Bolsa 5Kg',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              'Cantidad: 10',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              'Precio de Compra: S/ 15.50',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              'Precio de Venta: S/ 20.50',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Actualizar'),
                ),
                const SizedBox(
                  width: 15,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Borrar'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
