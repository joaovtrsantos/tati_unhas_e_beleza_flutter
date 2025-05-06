import 'package:flutter/material.dart';

class LoginCadastroTitulo extends StatelessWidget {
  const LoginCadastroTitulo({this.isLogin = true, super.key});

  final bool isLogin;

  @override
  Widget build(BuildContext context) {
    return Text(
                  isLogin 
                    ? 'Login'
                    : 'Cadastro',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                );
  }
}