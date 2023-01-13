import 'package:conin/models/categoria_model.dart';
import 'package:conin/models/producto_model.dart';
import 'package:conin/services/service_categoria.dart';
import 'package:conin/services/service_producto.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InventarioProvider extends ChangeNotifier {
  final listaOrdenada = <Object>[];

  void ordenarProductos(BuildContext context) {
    final categoriaService = Provider.of<CategoriaService>(context);
    final productoService = Provider.of<ProductoService>(context);
    for (Categoria categoria in categoriaService.categorias) {
      listaOrdenada.add(categoria);

      final productosPorCategoria = <Producto>[];
      for (Producto producto in productoService.productos) {
        if (producto.codcategoria == categoria.codcategoria) {
          productosPorCategoria.add(producto);
        }
      }

      listaOrdenada.addAll(productosPorCategoria);
    }
  }
}
