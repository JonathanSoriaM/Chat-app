import 'package:chat/pages/chat_page.dart';
import 'package:chat/pages/loading_page.dart';
import 'package:chat/pages/login_page.dart';
import 'package:chat/pages/register_page.dart';
import 'package:chat/pages/usuarios_page.dart';
import 'package:flutter/widgets.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  'usuarios': (__) => UsuariosPage(),
  'chat': (__) => ChatPage(),
  'loading': (__) => LoadingPage(),
  'login': (__) => LoginPage(),
  'register': (__) => RegisterPage()
};
