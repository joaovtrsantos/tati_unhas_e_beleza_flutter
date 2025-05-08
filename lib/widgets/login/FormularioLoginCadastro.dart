import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tati_unhas_e_beleza_flutter/widgets/PaginaInicial.dart';
import 'package:tati_unhas_e_beleza_flutter/widgets/login/Auth.dart';
import 'package:tati_unhas_e_beleza_flutter/widgets/login/BotaoCadastro.dart';
import 'package:tati_unhas_e_beleza_flutter/widgets/login/BotaoSubmit.dart';
import 'package:tati_unhas_e_beleza_flutter/widgets/login/InputFormulario.dart';
import 'package:tati_unhas_e_beleza_flutter/widgets/login/PaginaLoginCadastro.dart';

class FormularioLoginCadastro extends StatelessWidget {
  const FormularioLoginCadastro({
    this.isLogin = true,
    required this.onAlternarModo,
    super.key,
  });

  final bool isLogin;
  final VoidCallback onAlternarModo;

  @override
  Widget build(BuildContext context) {
    final TextEditingController _controllerEmail = TextEditingController();
    final TextEditingController _controllerSenha = TextEditingController();
    final TextEditingController _controllerNome = TextEditingController();
    final TextEditingController _controllerTelefone = TextEditingController();
    String? errorMessage = '';

    Future<void> signInWithEmailAndPassword() async {
      try {
        await Auth().signInWithEmailAndPassword(
          email: _controllerEmail.text,
          password: _controllerSenha.text,
        );
      } on FirebaseAuthException catch (e) {
        errorMessage = e.message;
      }
    }

    Future<void> createUserWithEmailAndPassword() async {
      try {
        await Auth().createUserWithEmailAndPassword(
          email: _controllerEmail.text,
          password: _controllerSenha.text,
        );

        CollectionReference usuarios = FirebaseFirestore.instance.collection('Usuarios');
        await usuarios.add({
          'admin': false,
          'email': _controllerEmail.text,
          'nome': _controllerNome.text,
          'telefone': _controllerTelefone.text,
        });
      } on FirebaseAuthException catch (e) {
        errorMessage = e.message;
      }
    }

    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('E-mail', textAlign: TextAlign.left),
          const SizedBox(height: 5),
          InputFormulario(_controllerEmail),
          const SizedBox(height: 20),
          const Text('Senha', textAlign: TextAlign.left),
          InputFormulario(_controllerSenha),
          if (!isLogin) ...[
            SizedBox(height: 20),
            const Text('Nome', textAlign: TextAlign.left),
            InputFormulario(_controllerNome),
            SizedBox(height: 20),
            const Text('Telefone', textAlign: TextAlign.left),
            InputFormulario(_controllerTelefone),
          ],
          const SizedBox(height: 30),
          BotaoSubmit(
            onPressed: () async {
              if (isLogin) {
                await signInWithEmailAndPassword();
                if (context.mounted) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => TatiUnhasEBelezaApp()),
                  );
                }
              } else {
                createUserWithEmailAndPassword();
                if (context.mounted) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => LoginCadastro()),
                  );
                }
              }
            },
            texto: isLogin ? "Entrar" : "Cadastrar",
          ),
          Text(errorMessage == '' ? '' : 'Erro ao fazer login $errorMessage'),
          isLogin
              ? BotaoCadastro(onPressed: onAlternarModo)
              : BotaoCadastro(isLogin: false, onPressed: onAlternarModo),
        ],
      ),
    );
  }
}
