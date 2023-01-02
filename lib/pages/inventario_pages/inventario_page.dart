import 'package:conin/services/service_categoria.dart';
import 'package:conin/services/service_producto.dart';
import 'package:conin/widgets/card_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InventarioPageConin extends StatelessWidget {
  const InventarioPageConin({super.key});

  @override
  Widget build(BuildContext context) {
    final categoriaService = Provider.of<CategoriaService>(context);
    final productoService = Provider.of<ProductoService>(context);

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
              // Text('Abarrotes'),
              Flexible(
                child: SizedBox(
                  // height: double.infinity,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: categoriaService.categorias.length,
                    itemBuilder: (BuildContext context, int index) {
                      print(categoriaService.categorias);
                      final datoc = categoriaService.categorias[index];
                      final datop = productoService.productos[index];
                      if (datoc.codcategoria == datop.codcategoria) {
                        return ListTile(
                          title: Text(datoc.nomcategoria),
                        );
                      } else {
                        return ListView.builder(
                            itemCount: productoService.productos.length,
                            itemBuilder: (BuildContext context, int index) {
                              final datopro = productoService.productos[index];
                              return ListTile(
                                title: Text(datoc.nomcategoria),
                                subtitle: Text(datopro.nomproducto),
                              );
                            });
                      }

                      // Column(
                      //   crossAxisAlignment: CrossAxisAlignment.start,
                      //   children: [
                      //     Text(datoc.nomcategoria),
                      //     ListView.builder(
                      //         itemCount: productoService.productos.length,
                      //         itemBuilder: (BuildContext context, int index) {
                      //           print(categoriaService.categorias);
                      //           final datop = productoService.productos[index];
                      //           if (datoc.codcategoria == datop.codcategoria) {
                      //             return CardCustom(
                      //               leading: Image.network(
                      //                   'https://mercury.vteximg.com.br/arquivos/ids/6378372-3000-3000/image-a51dc2569d5f4e879833137aaebfe692.jpg?v=637835842665300000'),
                      //               title: Text(datop.nomproducto),
                      //               subtitle: Text(datop.desproducto),
                      //               onPressedActualizar: () {},
                      //               onPressedBorrar: () {},
                      //               onPressedVer: () {
                      //                 Navigator.pushNamed(
                      //                     context, '/vermasinventario');
                      //               },
                      //             );
                      //           } else {
                      //             return const Text(
                      //                 'No hay productos en esta categoria');
                      //           }
                      //         })
                      //   ],
                      // );
                    },
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
