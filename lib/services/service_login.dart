import 'package:conin/config/config.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginConinService extends ChangeNotifier {
  static String codequipo = '';
  static String correoUser = '';
  static int codigoUser = 0;

  final String _baseUrl =
      'https://vmuonqoiajtmideublfb.supabase.co/rest/v1/Usuario';
  // final String _supabasekey =
  //     'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InZtdW9ucW9pYWp0bWlkZXVibGZiIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzE1OTY0MjAsImV4cCI6MTk4NzE3MjQyMH0.t9B2GKDEIgpjPHfxUSH_3p2dDXTO-EqJWlZg9Kpcjaw';
  // final String _supabaseauth =
  //     'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InZtdW9ucW9pYWp0bWlkZXVibGZiIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzE1OTY0MjAsImV4cCI6MTk4NzE3MjQyMH0.t9B2GKDEIgpjPHfxUSH_3p2dDXTO-EqJWlZg9Kpcjaw';
  final SupabaseClient client = SupabaseClient(
      'https://vmuonqoiajtmideublfb.supabase.co',
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InZtdW9ucW9pYWp0bWlkZXVibGZiIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzE1OTY0MjAsImV4cCI6MTk4NzE3MjQyMH0.t9B2GKDEIgpjPHfxUSH_3p2dDXTO-EqJWlZg9Kpcjaw');

  Future<String?> loginUser(String email, String password) async {
    final Map<String, String> header = {
      'apikey': CredencialesConin.supabasekey,
      'Authorization': CredencialesConin.supabaseauth
    };

    final Map<String, dynamic> authData = {
      'correou': 'eq.$email',
      'contraseñau': 'eq.$password'
    };

    final url = (Uri.parse(_baseUrl)).replace(queryParameters: authData);

    final response = await http.get(url, headers: header);
    final List<dynamic> decodeResponse = json.decode(response.body);
    if (decodeResponse.isEmpty) {
      print('MSG => ERROR AL INICIAR SESION');
      return "Error al iniciar sesion";
    } else {
      print('MSG => SE INICIO CORRECTAMENTE');
      codequipo = decodeResponse[0]['codequipo'];
      correoUser = decodeResponse[0]['correou'];
      codigoUser = decodeResponse[0]['codusuario'];
      print('MSG => CODIGO DE codigoUser: $codigoUser');
      print('MSG => CODIGO DE EQUIPO: $codequipo');
      return null;
    }
  }

  Future<String?> registerUser(
      String nombre, String codequipo, String email, String password) async {
    final String msg;
    final Map<String, String> header = {
      'apikey': CredencialesConin.supabasekey,
      'Authorization': CredencialesConin.supabaseauth,
      'Content-Type': 'application/json',
      'Prefer': 'return=minimal'
    };

    final body = jsonEncode({
      "nombreu": nombre,
      "codequipo": codequipo,
      "correou": email,
      "contraseñau": password
    });

    final url = Uri.parse(_baseUrl);
    final response = await http.post(url, body: body, headers: header);

    // final decodedData = json.decode(response.body);

    if (response.statusCode != 201) {
      print('MSG => NO SE GUARDO CORRECTAMENTE');
      msg = 'NO SE GUARDO CORRECTAMENTE';

      return msg;
    } else {
      print('MSG =>  SE GUARDO CORRECTAMENTE');
      msg = 'SE GUARDO CORRECTAMENTE';
      return null;
    }
    // lugar.id = decodedData['name'];
    // lugares.add(lugar);
    // return lugar.id!;
  }
}
