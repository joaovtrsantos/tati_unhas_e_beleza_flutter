import 'package:flutter/material.dart';
import 'package:tati_unhas_e_beleza_flutter/widgets/ImagensCapa.dart';

class Capa extends StatelessWidget {
  const Capa({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 10,
      children: [
        Imagenscapa(caminhoImagem: 'assets/unhas1.jpg'),
        Imagenscapa(caminhoImagem: 'assets/unhas2.jpg'),
        Imagenscapa(caminhoImagem: 'assets/unhas3.jpg'),
      ],
    );
  }
}
