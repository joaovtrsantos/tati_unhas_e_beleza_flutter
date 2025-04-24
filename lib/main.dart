import 'package:flutter/material.dart';
import 'package:tati_unhas_e_beleza_flutter/widgets/BotaoAgendamento.dart';
import 'package:tati_unhas_e_beleza_flutter/widgets/Cabecalho.dart';
import 'package:tati_unhas_e_beleza_flutter/widgets/Capa.dart';
import 'package:tati_unhas_e_beleza_flutter/widgets/Informacoes.dart';
import 'package:tati_unhas_e_beleza_flutter/widgets/Logo.dart';
import 'package:tati_unhas_e_beleza_flutter/widgets/Slogan.dart';
import 'package:tati_unhas_e_beleza_flutter/widgets/SubtextoSlogan.dart';

main() {
  runApp(TatiUnhasEBelezaApp());
}

class TatiUnhasEBelezaAppState extends State<TatiUnhasEBelezaApp>{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: Cabecalho(),
        body: ListView(
          children: [
            // Logo(),
            Capa(),
            Slogan(),
            SubtextoSlogan(),
            BotaoAgendamento()
            // Informacoes()
          ],
        ),
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