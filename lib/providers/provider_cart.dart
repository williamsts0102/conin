import 'package:conin/models/producto_model.dart';
import 'package:flutter/cupertino.dart';

class CartProvider with ChangeNotifier {
  int _counter = 0;
  int _quantity = 1;
  int get counter => _counter;
  int get quantity => _quantity;

  double _totalPrice = 0.0;
  double get totalPrice => _totalPrice;

  List<dynamic> cart = [];

  void insertProduct(
      {required int? codproducto,
      required String nomproducto,
      required String desproducto,
      required int canproducto,
      required num preventa,
      required String? fotoproducto,
      required int contador}) {
    Map<String, dynamic> productMap = {
      'codproducto': codproducto,
      'nomproducto': nomproducto,
      'desproducto': desproducto,
      'canproducto': canproducto,
      'preventa': preventa,
      'fotoproducto': fotoproducto,
      'contador': contador,
    };
    cart.add(productMap);
  }

  void addCounter() {
    _counter++;
    notifyListeners();
  }

  void removeCounter() {
    _counter--;
    notifyListeners();
  }

  void resetCounter() {
    _counter = 0;
    notifyListeners();
  }

  int getCounter() {
    return _counter;
  }

  void addQuantity(int id) {
    final index = cart.indexWhere((element) => element['codproducto'] == id);

    cart[index]['contador'] = cart[index]['contador'] + 1;
    notifyListeners();
  }

  void deleteQuantity(int id) {
    final index = cart.indexWhere((element) => element.codproducto == id);
    final currentQuantity = cart[index].canproducto;
    if (currentQuantity <= 1) {
      currentQuantity == 1;
    } else {
      cart[index].canproducto = currentQuantity - 1;
    }
    notifyListeners();
  }

  void removeItem(int id) {
    final index = cart.indexWhere((element) => element.codproducto == id);
    cart.removeAt(index);
    notifyListeners();
  }

  int getQuantity(int quantity) {
    return _quantity;
  }

  void addTotalPrice(double productPrice) {
    _totalPrice = _totalPrice + productPrice;
    notifyListeners();
  }

  void removeTotalPrice(double productPrice) {
    _totalPrice = _totalPrice - productPrice;
    notifyListeners();
  }

  double getTotalPrice() {
    return _totalPrice;
  }
}
