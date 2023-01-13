import 'package:conin/config/config.dart';
import 'package:conin/models/producto_model.dart';
import 'package:conin/services/service_login.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProductoService extends ChangeNotifier {
  String codequipoUser = LoginConinService.codequipo;

  final String baseUrl =
      'https://vmuonqoiajtmideublfb.supabase.co/rest/v1/Producto';
  final String supabasekey =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InZtdW9ucW9pYWp0bWlkZXVibGZiIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzE1OTY0MjAsImV4cCI6MTk4NzE3MjQyMH0.t9B2GKDEIgpjPHfxUSH_3p2dDXTO-EqJWlZg9Kpcjaw';
  final String supabaseauth =
      'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InZtdW9ucW9pYWp0bWlkZXVibGZiIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzE1OTY0MjAsImV4cCI6MTk4NzE3MjQyMH0.t9B2GKDEIgpjPHfxUSH_3p2dDXTO-EqJWlZg9Kpcjaw';
  final SupabaseClient client = SupabaseClient(
      'https://vmuonqoiajtmideublfb.supabase.co',
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InZtdW9ucW9pYWp0bWlkZXVibGZiIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzE1OTY0MjAsImV4cCI6MTk4NzE3MjQyMH0.t9B2GKDEIgpjPHfxUSH_3p2dDXTO-EqJWlZg9Kpcjaw');

  final List<Producto> productos = [];

  late Producto seleccionarProducto;

  bool isLoading = true;
  bool isSaving = false;

  ProductoService() {
    listarProductos();
  }

  Future<List<Producto>> listarProductos() async {
    isLoading = true;
    notifyListeners();

    final Map<String, String> header = {
      'apikey': supabasekey,
      'Authorization': supabaseauth
    };

    final Map<String, dynamic> parameter = {
      'codequipo': 'eq.$codequipoUser',
    };
    final url = (Uri.parse(baseUrl)).replace(queryParameters: parameter);

    final response = await http.get(url, headers: header);
    final List<dynamic> productosList = json.decode(response.body);
    print('Esto es codeq $codequipoUser');
    // final Map<String, dynamic> productosMap = {};
    // for (int i = 0; i < productosList.length; i++) {
    //   productosMap[i.toString()] = productosList[i];
    // }
    print('esto es productosList $productosList');
    // print('esto es productosMap $productosMap');
    for (int i = 0; i < productosList.length; i++) {
      final productoTemporal = Producto.fromMap(productosList[i]);
      productoTemporal.codproducto = productosList[i]['codproducto'];
      productos.add(productoTemporal);
    }
    // productosMap.forEach((key, value) {
    //   final productoTemporal = Producto.fromMap(value);
    //   productoTemporal.codproducto = int.parse(key);
    //   productos.add(productoTemporal);
    //   print('Esto es codeq $codequipoUser');
    // });
    // categoriasMap.forEach((key, value) {
    //   final String categoriaTemporal = Categoria.fromMap(value);
    //   categorias.add(categoriaTemporal);
    // });
    print('Esto es codeq $codequipoUser');
    isLoading = false;
    print('esto es productosList $productosList');
    notifyListeners();
    return productos;
  }

  Future<String> actualizarCantidadProducto(
      int codproducto, int canproducto, int canprodudv) async {
    final String msg;
    final Map<String, String> header = {
      'apikey': CredencialesConin.supabasekey,
      'Authorization': CredencialesConin.supabaseauth,
      'Content-Type': 'application/json',
      'Prefer': 'return=minimal'
    };
    final int acantidad = canproducto - canprodudv;
    final body = jsonEncode({
      "canproducto": acantidad,
    });

    final Map<String, dynamic> parameter = {
      'codproducto': 'eq.$codproducto',
    };
    final url = (Uri.parse(baseUrl)).replace(queryParameters: parameter);

    final response = await http.post(url, body: body, headers: header);

    if (response.statusCode != 201) {
      print('MSG => NO SE GUARDO CORRECTAMENTE');
      msg = 'NO SE GUARDO CORRECTAMENTE';
    } else {
      print('MSG =>  SE GUARDO CORRECTAMENTE');
      msg = ' SE GUARDO CORRECTAMENTE';
    }
    notifyListeners();
    return msg;
  }
}
