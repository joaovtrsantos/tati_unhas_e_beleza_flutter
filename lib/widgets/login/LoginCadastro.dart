import 'package:flutter/material.dart';
import 'package:tati_unhas_e_beleza_flutter/widgets/login/FormularioLoginCadastro.dart';
import 'package:tati_unhas_e_beleza_flutter/widgets/login/LoginCadastroTitulo.dart';

class LoginCadastro extends StatefulWidget {
  const LoginCadastro({super.key});

  @override
  State<LoginCadastro> createState() => _LoginCadastroState();
}

class _LoginCadastroState extends State<LoginCadastro> {
  bool isLogin = true;

  void alternarModo() {
    setState(() {
      isLogin = !isLogin;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(backgroundColor: Color.fromARGB(255, 255, 230, 240)),
        body: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
                LoginCadastroTitulo(isLogin: isLogin),
                const SizedBox(height: 80),
                FormularioLoginCadastro(isLogin: isLogin, onAlternarModo: alternarModo,),
                const SizedBox(height: 5),
              ],
            ),
          ],
        ),
      ); 
  }
}
