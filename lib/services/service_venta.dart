import 'dart:convert';
import 'dart:math';

import 'package:conin/config/config.dart';
import 'package:conin/services/service_login.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:http/http.dart' as http;

class VentaConinService extends ChangeNotifier {
  int codusuario = LoginConinService.codigoUser;
  String codventa = '';
  final String _baseUrl =
      'https://vmuonqoiajtmideublfb.supabase.co/rest/v1/Venta';
  final String _baseUrlDetalle =
      'https://vmuonqoiajtmideublfb.supabase.co/rest/v1/DetalleVenta';

  final SupabaseClient client = SupabaseClient(
      'https://vmuonqoiajtmideublfb.supabase.co',
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InZtdW9ucW9pYWp0bWlkZXVibGZiIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzE1OTY0MjAsImV4cCI6MTk4NzE3MjQyMH0.t9B2GKDEIgpjPHfxUSH_3p2dDXTO-EqJWlZg9Kpcjaw');

  Future<String> registerVenta() async {
    final String msg;
    String generateCode() {
      final random = Random();
      final code = StringBuffer();
      const characters =
          'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';

      for (int i = 0; i < 15; i++) {
        code.write(characters[random.nextInt(characters.length)]);
      }
      return code.toString();
    }

    codventa = generateCode();
    print('CODIGO VENTA => $codventa');
    final Map<String, String> header = {
      'apikey': CredencialesConin.supabasekey,
      'Authorization': CredencialesConin.supabaseauth,
      'Content-Type': 'application/json',
      'Prefer': 'return=minimal'
    };

    final body = jsonEncode({
      "codventa": codventa,
      "codusuario": codusuario,
    });

    final url = Uri.parse(_baseUrl);
    final response = await http.post(url, body: body, headers: header);

    if (response.statusCode != 201) {
      print('MSG => NO SE GUARDO CORRECTAMENTE');
      msg = 'NO SE GUARDO CORRECTAMENTE';
    } else {
      print('MSG =>  SE GUARDO CORRECTAMENTE');
      msg = ' SE GUARDO CORRECTAMENTE';
    }
    return msg;
  }

  Future<String> registerDetalleVenta(
      int codproducto, int canprodudv, num preventadv) async {
    final String msg;
    final Map<String, String> header = {
      'apikey': CredencialesConin.supabasekey,
      'Authorization': CredencialesConin.supabaseauth,
      'Content-Type': 'application/json',
      'Prefer': 'return=minimal'
    };

    final body = jsonEncode({
      "codventa": codventa,
      "codproducto": codproducto,
      "canprodudv": canprodudv,
      "preventadv": preventadv,
    });

    final url = Uri.parse(_baseUrlDetalle);
    final response = await http.post(url, body: body, headers: header);

    if (response.statusCode != 201) {
      print('MSG => NO SE GUARDO CORRECTAMENTE');
      msg = 'NO SE GUARDO CORRECTAMENTE';
    } else {
      print('MSG =>  SE GUARDO CORRECTAMENTE');
      msg = ' SE GUARDO CORRECTAMENTE';
    }
    return msg;
  }
}
