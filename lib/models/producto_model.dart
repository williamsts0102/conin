import 'dart:convert';

class Producto {
  int? codproducto;
  String nomproducto;
  String desproducto;
  String? fotoproducto;
  int canproducto;
  num precompra;
  num preventa;
  int codcategoria;

  Producto({
    required this.codcategoria,
    required this.preventa,
    required this.precompra,
    required this.canproducto,
    this.fotoproducto,
    required this.desproducto,
    required this.nomproducto,
    this.codproducto,
  });

  factory Producto.fromJson(String str) => Producto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Producto.fromMap(Map<String, dynamic> json) => Producto(
        codcategoria: json["codcategoria"],
        preventa: json["preventa"],
        precompra: json["precompra"],
        canproducto: json["canproducto"],
        fotoproducto: json["fotoproducto"],
        desproducto: json["desproducto"],
        nomproducto: json["nomproducto"],
      );

  Map<String, dynamic> toMap() => {
        "codcategoria": codcategoria,
        "preventa": preventa,
        "precompra": precompra,
        "canproducto": canproducto,
        "fotoproducto": fotoproducto,
        "desproducto": desproducto,
        "nomproducto": nomproducto,
      };

  Producto copyWith() => Producto(
        codcategoria: codcategoria,
        preventa: preventa,
        precompra: precompra,
        canproducto: canproducto,
        fotoproducto: fotoproducto,
        desproducto: desproducto,
        nomproducto: nomproducto,
        codproducto: codproducto,
      );
}
