import 'package:conin/models/categoria_model.dart';
import 'package:conin/services/service_login.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CategoriaService extends ChangeNotifier {
  String codequipoUser = LoginConinService.codequipo;

  final String baseUrl =
      'https://vmuonqoiajtmideublfb.supabase.co/rest/v1/Categoria';
  final String supabasekey =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InZtdW9ucW9pYWp0bWlkZXVibGZiIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzE1OTY0MjAsImV4cCI6MTk4NzE3MjQyMH0.t9B2GKDEIgpjPHfxUSH_3p2dDXTO-EqJWlZg9Kpcjaw';
  final String supabaseauth =
      'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InZtdW9ucW9pYWp0bWlkZXVibGZiIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzE1OTY0MjAsImV4cCI6MTk4NzE3MjQyMH0.t9B2GKDEIgpjPHfxUSH_3p2dDXTO-EqJWlZg9Kpcjaw';
  final SupabaseClient client = SupabaseClient(
      'https://vmuonqoiajtmideublfb.supabase.co',
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InZtdW9ucW9pYWp0bWlkZXVibGZiIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzE1OTY0MjAsImV4cCI6MTk4NzE3MjQyMH0.t9B2GKDEIgpjPHfxUSH_3p2dDXTO-EqJWlZg9Kpcjaw');

  final List<Categoria> categorias = [];

  late Categoria seleccionarCategoria;

  bool isLoading = true;
  bool isSaving = false;

  CategoriaService() {
    listarCategorias();
    print('Esto es listarCategorias $listarCategorias()');
    print('Esto es listarCategorias.toString() $listarCategorias.toString()');
  }

  Future<List<Categoria>> listarCategorias() async {
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
    final List<dynamic> categoriasList = json.decode(response.body);
    print('Esto es codeq $codequipoUser');
    // final Map<String, dynamic> categoriasMap = {};
    // for (int i = 0; i < categoriasList.length; i++) {
    //   categoriasMap[i.toString()] = categoriasList[i];
    // }
    print('esto es categoriasList $categoriasList');
    // print('esto es cagetogirasmap $categoriasMap');
    for (int i = 0; i < categoriasList.length; i++) {
      final categoriaTemporal = Categoria.fromMap(categoriasList[i]);
      categoriaTemporal.codcategoria = categoriasList[i]['codcategoria'];
      categorias.add(categoriaTemporal);
    }
    print('esto es categoriasList $categoriasList');

    isLoading = false;
    notifyListeners();
    return categorias;
  }
}
