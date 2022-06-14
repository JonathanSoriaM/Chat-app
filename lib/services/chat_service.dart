import 'package:chat/global/enviroment.dart';
import 'package:chat/models/mensajes_response.dart';
import 'package:chat/models/usuarios.dart';
import 'package:chat/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ChatService with ChangeNotifier {
  late Usuario usuarioPara;

  Future getChat(String usuarioID) async {
    final resp = await http
        .get(Uri.parse('${Enviroment.apiUrl}/mensajes/${usuarioID}'), headers: {
      'Content-type': 'application/json',
      'x-token': await AuthService.getToken()
    });

    final mensajesResponse = mensajesResponseFromJson(resp.body);

    return mensajesResponse.mensajes;
  }
}
