import 'package:badges/badges.dart';
import 'package:conin/models/categoria_model.dart';
import 'package:conin/models/producto_model.dart';
import 'package:conin/providers/provider_cart.dart';
import 'package:conin/providers/provider_inventario.dart';
import 'package:conin/services/service_categoria.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VentaPageConin extends StatelessWidget {
  const VentaPageConin({super.key});

  @override
  Widget build(BuildContext context) {
    final categoriaService = Provider.of<CategoriaService>(context);

    final inventarioP = Provider.of<InventarioProvider>(context);
    inventarioP.listaOrdenada.clear();
    inventarioP.ordenarProductos(context);
    final cart = Provider.of<CartProvider>(context);
    print('Guardados => ${cart.cart}');

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Venta'),
        actions: [
          Badge(
            badgeContent: Consumer<CartProvider>(
              builder: (context, value, child) {
                return Text(
                  value.getCounter().toString(),
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                );
              },
            ),
            position: const BadgePosition(start: 30, bottom: 30),
            child: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/carrito');
              },
              icon: const Icon(Icons.shopping_cart),
            ),
          ),
          const SizedBox(
            width: 20.0,
          ),
        ],
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: inventarioP.listaOrdenada.length,
        itemBuilder: (BuildContext context, int index) {
          final listord = inventarioP.listaOrdenada[index];
          if (listord is Categoria) {
            return ListTile(
              title: Text(listord.nomcategoria),
            );
          } else if (listord is Producto) {
            return Card(
              color: Colors.blueGrey.shade200,
              elevation: 5.0,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const Image(
                      image: NetworkImage(
                          'https://img.freepik.com/psd-gratis/caja-carton-aislada_125540-1169.jpg'),
                      height: 80,
                      width: 80,
                    ),
                    SizedBox(
                      width: 180,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 5.0,
                          ),
                          RichText(
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            text: TextSpan(
                                text: 'Nombre: ',
                                style: TextStyle(
                                    color: Colors.blueGrey.shade800,
                                    fontSize: 16.0),
                                children: [
                                  TextSpan(
                                      text: '${listord.nomproducto}\n',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold))
                                ]),
                          ),
                          RichText(
                            maxLines: 1,
                            text: TextSpan(
                                text: 'Descripcion: ',
                                style: TextStyle(
                                    color: Colors.blueGrey.shade800,
                                    fontSize: 16.0),
                                children: [
                                  TextSpan(
                                      text: '${listord.desproducto}\n',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold))
                                ]),
                          ),
                          RichText(
                            maxLines: 1,
                            text: TextSpan(
                                text: 'Price: ' r"S/.",
                                style: TextStyle(
                                    color: Colors.blueGrey.shade800,
                                    fontSize: 16.0),
                                children: [
                                  TextSpan(
                                      text: '${listord.preventa}\n',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold))
                                ]),
                          ),
                          RichText(
                            maxLines: 1,
                            text: TextSpan(
                                text: 'Cantidad: ',
                                style: TextStyle(
                                    color: Colors.blueGrey.shade800,
                                    fontSize: 16.0),
                                children: [
                                  TextSpan(
                                      text: '${listord.canproducto}\n',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold))
                                ]),
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.blueGrey.shade900),
                        onPressed: () {
                          cart.addCounter();
                          cart.insertProduct(
                              codproducto: listord.codproducto,
                              nomproducto: listord.nomproducto,
                              desproducto: listord.desproducto,
                              canproducto: listord.canproducto,
                              preventa: listord.preventa,
                              fotoproducto: listord.fotoproducto,
                              contador: 1);
                        },
                        child: const Text('Agregar'))
                  ],
                ),
              ),
            );
          } else {
            return const Text('No hay productos');
          }
        },
      ),
    );
  }
}
