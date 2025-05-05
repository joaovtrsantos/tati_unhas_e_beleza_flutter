import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tati_unhas_e_beleza_flutter/widgets/login/Auth.dart';
import 'package:tati_unhas_e_beleza_flutter/widgets/login/BotaoCadastro.dart';
import 'package:tati_unhas_e_beleza_flutter/widgets/login/FormularioLogin.dart';
import 'package:tati_unhas_e_beleza_flutter/widgets/login/LoginTitulo.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(backgroundColor: Color.fromARGB(255, 255, 230, 240)),
        body: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 50),
                LoginTitulo(),
                SizedBox(height: 80),
                Formulariologin(),
                SizedBox(height: 5),
                BotaoCadastro(),
              ],
            ),
          ],
        ),
      );
  }
}
