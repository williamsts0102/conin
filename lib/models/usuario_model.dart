import 'dart:convert';

class Usuario {
  int? codusuario;
  String correou;
  String nombreu;
  String? telefonou;
  String? fotou;
  String codequipo;
  String codcargo;

  Usuario({
    required this.codcargo,
    required this.codequipo,
    this.fotou,
    this.telefonou,
    required this.nombreu,
    required this.correou,
    this.codusuario,
  });

  factory Usuario.fromJson(String str) => Usuario.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Usuario.fromMap(Map<String, dynamic> json) => Usuario(
        codcargo: json["codcargo"],
        codequipo: json["codequipo"],
        fotou: json["fotou"],
        telefonou: json["telefonou"],
        nombreu: json["nombreu"],
        correou: json["correou"],
      );

  Map<String, dynamic> toMap() => {
        "codcargo": codcargo,
        "codequipo": codequipo,
        "fotou": fotou,
        "telefonou": telefonou,
        "nombreu": nombreu,
        "correou": correou,
      };

  Usuario copyWith() => Usuario(
        codcargo: codcargo,
        codequipo: codequipo,
        fotou: fotou,
        telefonou: telefonou,
        nombreu: nombreu,
        correou: correou,
        codusuario: codusuario,
      );
}
