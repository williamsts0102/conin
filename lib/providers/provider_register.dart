import 'package:flutter/material.dart';

class ProviderRegister extends ChangeNotifier {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  String nombre = '';
  String codequipo = '';
  String email = '';
  String password = '';

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  bool isValidForm() {
    return formkey.currentState?.validate() ?? false;
  }
}
