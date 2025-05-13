import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tati_unhas_e_beleza_flutter/widgets/PaginaInicial.dart';
import 'package:tati_unhas_e_beleza_flutter/widgets/login/Auth.dart';
import 'package:tati_unhas_e_beleza_flutter/widgets/login/BotaoCadastro.dart';
import 'package:tati_unhas_e_beleza_flutter/widgets/login/BotaoSubmit.dart';
import 'package:tati_unhas_e_beleza_flutter/widgets/login/InputFormulario.dart';
import 'package:tati_unhas_e_beleza_flutter/widgets/login/PaginaLoginCadastro.dart';

class FormularioLoginCadastro extends StatefulWidget {
  const FormularioLoginCadastro({
    this.isLogin = true,
    required this.onAlternarModo,
    super.key,
  });

  final bool isLogin;
  final VoidCallback onAlternarModo;

  @override
  State<FormularioLoginCadastro> createState() =>
      _FormularioLoginCadastroState();
}

class _FormularioLoginCadastroState extends State<FormularioLoginCadastro> {
  final _controllerEmail = TextEditingController();
  final _controllerSenha = TextEditingController();
  final _controllerNome = TextEditingController();
  final _controllerTelefone = TextEditingController();
  String? errorMessage = '';

  Future<void> signInWithEmailAndPassword() async {
    try {
      await Auth().signInWithEmailAndPassword(
        email: _controllerEmail.text,
        password: _controllerSenha.text,
      );
      setState(() => errorMessage = '');
      if (context.mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => TatiUnhasEBelezaApp()),
        );
      }
    } on FirebaseAuthException catch (e) {
      setState(() => errorMessage = e.message);
    }
  }

  Future<void> createUserWithEmailAndPassword() async {
    try {
       if (_controllerNome.text.isEmpty || _controllerTelefone.text.isEmpty) {
        setState(() {
          errorMessage = 'Preencha nome e telefone.';
        });
        return;
      }
      
      await Auth().createUserWithEmailAndPassword(
        email: _controllerEmail.text,
        password: _controllerSenha.text,
      );

      await FirebaseFirestore.instance.collection('Usuarios').add({
        'admin': false,
        'email': _controllerEmail.text,
        'nome': _controllerNome.text,
        'telefone': _controllerTelefone.text,
      });

      setState(() => errorMessage = '');
      if (context.mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => LoginCadastro()),
        );
      }
    } on FirebaseAuthException catch (e) {
      setState(() => errorMessage = e.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('E-mail'),
          const SizedBox(height: 5),
          InputFormulario(_controllerEmail),
          const SizedBox(height: 20),
          const Text('Senha'),
          InputFormulario(_controllerSenha, isSenha: true),
          if (!widget.isLogin) ...[
            const SizedBox(height: 20),
            const Text('Nome'),
            InputFormulario(_controllerNome),
            const SizedBox(height: 20),
            const Text('Telefone'),
            InputFormulario(_controllerTelefone),
          ],
          const SizedBox(height: 30),
          BotaoSubmit(
            onPressed: () async {
              if (widget.isLogin) {
                await signInWithEmailAndPassword();
              } else {
                await createUserWithEmailAndPassword();
              }
            },
            texto: widget.isLogin ? "Entrar" : "Cadastrar",
          ),
          if (errorMessage != null && errorMessage!.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                'Erro: $errorMessage',
                style: const TextStyle(color: Colors.red),
              ),
            ),
          BotaoCadastro(
            isLogin: widget.isLogin,
            onPressed: widget.onAlternarModo,
          ),
        ],
      ),
    );
  }
}
