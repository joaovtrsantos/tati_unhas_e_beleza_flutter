import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tati_unhas_e_beleza_flutter/widgets/PaginaInicial.dart';
import 'package:tati_unhas_e_beleza_flutter/widgets/login/Auth.dart';
import 'package:tati_unhas_e_beleza_flutter/widgets/login/PaginaLoginCadastro.dart';

class DecisorTela extends StatefulWidget {
  const DecisorTela({super.key});

  @override
  State<DecisorTela> createState() => _DecisorTelaState();
}

class _DecisorTelaState extends State<DecisorTela> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Auth().authStateChanges, 
      builder: (context, snapshot){
        if (snapshot.hasData) {
          return TatiUnhasEBelezaApp();
        } else {
          return const LoginCadastro();
        }
      }
    );
  }
}