import 'package:flutter/material.dart';
import 'package:tati_unhas_e_beleza_flutter/widgets/rodape/Informacoes.dart';
import 'package:tati_unhas_e_beleza_flutter/widgets/rodape/RedesSociais.dart';

class Rodape extends StatelessWidget {
  const Rodape({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 92,
      padding: EdgeInsets.fromLTRB(5, 16, 5, 14),
      color: const Color.fromARGB(255, 255, 230, 240), // fundo rosa claro
      child: Row(
        children: [
          Expanded(flex: 9, child: Informacoes()),
          Expanded(flex: 3, child: RedesSociais()),
        ],
      ),
    );
  }
}