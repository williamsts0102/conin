import 'package:conin/models/usuario_model.dart';
import 'package:conin/services/service_login.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class EquipoService extends ChangeNotifier {
  String codequipoUser = LoginConinService.codequipo;

  final String baseUrl =
      'https://vmuonqoiajtmideublfb.supabase.co/rest/v1/Usuario?select=codusuario,correou,nombreu,telefonou,fotou,codequipo(nomequipo),codcargo(nomcargo)';
  final String supabasekey =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InZtdW9ucW9pYWp0bWlkZXVibGZiIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzE1OTY0MjAsImV4cCI6MTk4NzE3MjQyMH0.t9B2GKDEIgpjPHfxUSH_3p2dDXTO-EqJWlZg9Kpcjaw';
  final String supabaseauth =
      'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InZtdW9ucW9pYWp0bWlkZXVibGZiIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzE1OTY0MjAsImV4cCI6MTk4NzE3MjQyMH0.t9B2GKDEIgpjPHfxUSH_3p2dDXTO-EqJWlZg9Kpcjaw';
  final SupabaseClient client = SupabaseClient(
      'https://vmuonqoiajtmideublfb.supabase.co',
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InZtdW9ucW9pYWp0bWlkZXVibGZiIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzE1OTY0MjAsImV4cCI6MTk4NzE3MjQyMH0.t9B2GKDEIgpjPHfxUSH_3p2dDXTO-EqJWlZg9Kpcjaw');

  final List<Usuario> usuarios = [];

  late Usuario seleccionarusuario;

  bool isLoading = true;
  bool isSaving = false;

  EquipoService() {
    listarUsuarios();
  }

  Future<List<Usuario>> listarUsuarios() async {
    isLoading = true;
    notifyListeners();

    final Map<String, String> header = {
      'apikey': supabasekey,
      'Authorization': supabaseauth
    };

    final String parameter = '&codequipo=eq.$codequipoUser';
    final url = (Uri.parse(baseUrl + parameter));

    final response = await http.get(url, headers: header);
    final List<dynamic> usuariosList = json.decode(response.body);
    for (var item in usuariosList) {
      if (item['codcargo'] is Map) {
        item['codcargo'] = item['codcargo']['nomcargo'];
      }
      if (item['codequipo'] is Map) {
        item['codequipo'] = item['codequipo']['nomequipo'];
      }
    }
    print(usuariosList);
    for (int i = 0; i < usuariosList.length; i++) {
      final usuarioTemporal = Usuario.fromMap(usuariosList[i]);
      usuarioTemporal.codusuario = usuariosList[i]['codusuario'];
      usuarios.add(usuarioTemporal);
    }

    isLoading = false;
    notifyListeners();
    return usuarios;
  }
}
