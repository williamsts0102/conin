import 'dart:convert';

class Categoria {
  int? codcategoria;
  String nomcategoria;
  String codequipo;

  Categoria({
    required this.codequipo,
    required this.nomcategoria,
    this.codcategoria,
  });

  factory Categoria.fromJson(String str) => Categoria.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Categoria.fromMap(Map<String, dynamic> json) => Categoria(
        codequipo: json["codequipo"],
        nomcategoria: json["nomcategoria"],
      );

  Map<String, dynamic> toMap() => {
        "codequipo": codequipo,
        "nomcategoria": nomcategoria,
      };

  Categoria copyWith() => Categoria(
        codequipo: codequipo,
        nomcategoria: nomcategoria,
        codcategoria: codcategoria,
      );
}
