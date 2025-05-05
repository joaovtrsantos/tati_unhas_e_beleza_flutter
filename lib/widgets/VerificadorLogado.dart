import 'package:flutter/material.dart';
import 'package:tati_unhas_e_beleza_flutter/widgets/PaginaInicial.dart';
import 'package:tati_unhas_e_beleza_flutter/widgets/login/Auth.dart';
import 'package:tati_unhas_e_beleza_flutter/widgets/login/Login.dart';

class VerificadorLogado extends StatefulWidget {
  const VerificadorLogado({super.key});

  @override
  State<VerificadorLogado> createState() => _VerificadorLogadoState();
}

class _VerificadorLogadoState extends State<VerificadorLogado> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Auth().authStateChanges, 
      builder: (context, snapshot){
        if (snapshot.hasData) {
          return TatiUnhasEBelezaApp();
        } else {
          return const Login();
        }
      }
      );
  }
}