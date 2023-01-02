import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginConinService extends ChangeNotifier {
  static String codequipo = '';

  final String _baseUrl =
      'https://vmuonqoiajtmideublfb.supabase.co/rest/v1/Usuario';
  final String _supabasekey =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InZtdW9ucW9pYWp0bWlkZXVibGZiIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzE1OTY0MjAsImV4cCI6MTk4NzE3MjQyMH0.t9B2GKDEIgpjPHfxUSH_3p2dDXTO-EqJWlZg9Kpcjaw';
  final String _supabaseauth =
      'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InZtdW9ucW9pYWp0bWlkZXVibGZiIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzE1OTY0MjAsImV4cCI6MTk4NzE3MjQyMH0.t9B2GKDEIgpjPHfxUSH_3p2dDXTO-EqJWlZg9Kpcjaw';
  final SupabaseClient client = SupabaseClient(
      'https://vmuonqoiajtmideublfb.supabase.co',
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InZtdW9ucW9pYWp0bWlkZXVibGZiIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzE1OTY0MjAsImV4cCI6MTk4NzE3MjQyMH0.t9B2GKDEIgpjPHfxUSH_3p2dDXTO-EqJWlZg9Kpcjaw');

  Future<String?> loginUser(String email, String password) async {
    final Map<String, String> header = {
      'apikey': _supabasekey,
      'Authorization': _supabaseauth
    };

    final Map<String, dynamic> authData = {
      'correo_u': 'eq.$email',
      'contraseña_u': 'eq.$password'
    };

    final url = (Uri.parse(_baseUrl)).replace(queryParameters: authData);

    final response = await http.get(url, headers: header);
    final List<dynamic> decodeResponse = json.decode(response.body);
    codequipo = decodeResponse[0]['cod_equipo'];
    if (decodeResponse.isEmpty) {
      print('MSG => ERROR AL INICIAR SESION');
      return "Error al iniciar sesion";
    } else {
      print('MSG => SE INICIO CORRECTAMENTE');
      String codequipoUser = decodeResponse[0]['cod_equipo'];
      codequipo = codequipoUser;
      print('MSG => CODIGO DE EQUIPO: $codequipo');
      return null;
    }
  }
}
