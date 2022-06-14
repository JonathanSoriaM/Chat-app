import 'package:chat/helpers/mostrar_alerta.dart';
import 'package:chat/services/auth_service.dart';
import 'package:chat/services/socket_service.dart';
import 'package:chat/widgets/btn_azul.dart';
import 'package:chat/widgets/custom_input.dart';
import 'package:chat/widgets/labels.dart';
import 'package:chat/widgets/logo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Color(0xffF2f2f2),
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.9,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  logo(
                    titulo: 'Messenger',
                  ),
                  _Form(),
                  labels(
                    ruta: 'register',
                    titulo: '¿No tienes cuenta?',
                    subTitulo: 'Crea una ahora',
                  ),
                  Text(
                    'Terminos y condiciones de uso',
                  )
                ],
              ),
            ),
          )),
    );
  }
}

class _Form extends StatefulWidget {
  _Form({Key? key}) : super(key: key);

  @override
  State<_Form> createState() => __FormState();
}

class __FormState extends State<_Form> {
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    final socketService = Provider.of<SocketService>(context);

    return Container(
      margin: EdgeInsets.only(top: 40),
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: <Widget>[
          CustomInput(
            icon: Icons.email_outlined,
            placeholder: 'Correo',
            keyboardType: TextInputType.emailAddress,
            textController: emailCtrl,
          ),
          CustomInput(
            icon: Icons.lock_outline,
            placeholder: 'Password',
            //keyboardType: TextInputType.emailAddress,
            textController: passCtrl,
            isPassword: true,
          ),
          BotonAzul(
              text: 'Ingresar',
              onPressed: authService.autenticando
                  ? null
                  : () async {
                      //print(emailCtrl.text);
                      //print(passCtrl.text);
                      FocusScope.of(context).unfocus();
                      final loginOk = await authService.login(
                          emailCtrl.text.trim(), passCtrl.text.trim());

                      if (loginOk) {
                        socketService.connect();
                        Navigator.pushReplacementNamed(context, 'usuarios');
                        // redireccion a otra pantalla
                      } else {
                        // Mostrar alerta
                        mostrarAlerta(context, 'Login Incorrecto',
                            'Correo o contraseña son incorrectos');
                      }
                    })
        ],
      ),
    );
  }
}
