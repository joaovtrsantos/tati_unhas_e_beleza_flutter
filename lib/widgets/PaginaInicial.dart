import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tati_unhas_e_beleza_flutter/widgets/BotaoAgendamento.dart';
import 'package:tati_unhas_e_beleza_flutter/widgets/Cabecalho.dart';
import 'package:tati_unhas_e_beleza_flutter/widgets/Capa.dart';
import 'package:tati_unhas_e_beleza_flutter/widgets/NossaEquipe.dart';
import 'package:tati_unhas_e_beleza_flutter/widgets/QuemSomos.dart';
import 'package:tati_unhas_e_beleza_flutter/widgets/Rodape.dart';
import 'package:tati_unhas_e_beleza_flutter/widgets/Slogan.dart';
import 'package:tati_unhas_e_beleza_flutter/widgets/SubtextoSlogan.dart';
import 'package:tati_unhas_e_beleza_flutter/widgets/login/Auth.dart';

class TatiUnhasEBelezaAppState extends State<TatiUnhasEBelezaApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Cabecalho(),
        body: ListView(
          children: [
            // Logo(),
            Capa(),
            Slogan(),
            SubtextoSlogan(),
            BotaoAgendamento(),
            QuemSomos(),
            NossaEquipe(),
            Rodape(),
            // Informacoes()
          ],
        ),
    );
  }
}

class TatiUnhasEBelezaApp extends StatefulWidget {
  const TatiUnhasEBelezaApp({super.key});

  @override
  TatiUnhasEBelezaAppState createState() {
    return TatiUnhasEBelezaAppState();
  }
}
