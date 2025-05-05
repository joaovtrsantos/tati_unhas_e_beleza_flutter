import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tati_unhas_e_beleza_flutter/widgets/login/Auth.dart';
import 'package:tati_unhas_e_beleza_flutter/widgets/login/BotaoSubmit.dart';
import 'package:tati_unhas_e_beleza_flutter/widgets/login/InputFormulario.dart';

class Formulariologin extends StatefulWidget {
  const Formulariologin({super.key});

  @override
  State<Formulariologin> createState() => _FormulariologinState();
}

class _FormulariologinState extends State<Formulariologin> {

  String? errorMessage = '';
  bool isLogin = true;

  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  Future<void> signInWithEmailAndPassword() async {
    try {
      await Auth().signInWithEmailAndPassword(
        email: _controllerEmail.text,
        password: _controllerPassword.text,
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  Future<void> createUserWithEmailAndPassword() async {
    try {
      await Auth().createUserWithEmailAndPassword(
        email: _controllerEmail.text,
        password: _controllerPassword.text,
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('E-mail', textAlign: TextAlign.left),
          const SizedBox(height: 5),
          InputFormulario(_controllerEmail),
          const SizedBox(height: 20),
          const Text('Senha', textAlign: TextAlign.left),
          InputFormulario(_controllerPassword),
          const SizedBox(height: 30),
          BotaoSubmit(
           onPressed: () async {
            isLogin 
            ? await signInWithEmailAndPassword() 
            : createUserWithEmailAndPassword();
           },
           texto: isLogin ? "Entrar" : "Cadastrar",
          ),
          Text(errorMessage == '' ? '' : 'Erro ao fazer login $errorMessage')
        ]
      ),
    );
  }
}
