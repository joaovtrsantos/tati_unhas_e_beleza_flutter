import 'package:flutter/material.dart';
import 'package:tati_unhas_e_beleza_flutter/widgets/Cabecalho.dart';
import 'package:tati_unhas_e_beleza_flutter/widgets/Informacoes.dart';
import 'package:tati_unhas_e_beleza_flutter/widgets/Logo.dart';

main() {
  runApp(TatiUnhasEBelezaApp());
}

class TatiUnhasEBelezaAppState extends State<TatiUnhasEBelezaApp>{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: Cabecalho(),
        body: ListView(
          children: [
            Logo(),
            Informacoes()
          ],
        ),
        backgroundColor: Color.fromARGB(255, 251, 238, 248)  
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