import 'package:conin/models/categoria_model.dart';
import 'package:conin/models/producto_model.dart';
import 'package:conin/providers/provider_inventario.dart';
import 'package:conin/services/service_categoria.dart';
import 'package:conin/widgets/card_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InventarioPageConin extends StatelessWidget {
  const InventarioPageConin({super.key});

  @override
  Widget build(BuildContext context) {
    final categoriaService = Provider.of<CategoriaService>(context);

    final inventarioP = Provider.of<InventarioProvider>(context);
    inventarioP.listaOrdenada.clear();
    inventarioP.ordenarProductos(context);

    if (categoriaService.isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

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
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: SizedBox(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: inventarioP.listaOrdenada.length,
                    itemBuilder: (BuildContext context, int index) {
                      final listord = inventarioP.listaOrdenada[index];
                      if (listord is Categoria) {
                        return ListTile(
                          title: Text(
                            listord.nomcategoria,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        );
                      } else if (listord is Producto) {
                        return CardCustom(
                          leading: Image.network(
                              'https://img.freepik.com/psd-gratis/caja-carton-aislada_125540-1169.jpg'),
                          title: Text(
                              '${listord.nomproducto}\n${listord.desproducto}'),
                          subtitle: Text(
                            'Cantidad: ${listord.canproducto}\nprecioVenta: S/.${listord.preventa}\nprecioCompra: S/.${listord.precompra}',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          onPressedActualizar: () {},
                          onPressedBorrar: () {},
                          onPressedVer: () {
                            // verMas(listord.codproducto);
                            Navigator.pushNamed(context, '/vermasinventario');
                          },
                        );
                      } else {
                        return const Text('No hay productos');
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
