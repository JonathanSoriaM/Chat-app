// To parse this JSON data, do
//
//     final usuario = usuarioFromJson(jsonString);

import 'dart:convert';

Usuario usuarioFromJson(String str) => Usuario.fromJson(json.decode(str));

String usuarioToJson(Usuario data) => json.encode(data.toJson());

class Usuario {
  Usuario({
    required this.uid,
    required this.nombre,
    required this.email,
    required this.online,
  });

  String uid;
  String nombre;
  String email;

  bool online;

  factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
        uid: json["_id"],
        nombre: json["nombre"],
        email: json["email"],
        online: json["online"],
      );

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "nombre": nombre,
        "email": email,
        "online": online,
      };
}
