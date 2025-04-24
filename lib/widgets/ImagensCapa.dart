import 'package:flutter/material.dart';

class Imagenscapa extends StatelessWidget {
  const Imagenscapa({required this.caminhoImagem, super.key});

  final String caminhoImagem;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Image(
            image: AssetImage(caminhoImagem),
            width: 100,
            height: 100,
          ),
        ),
      ],
    );
  }
}
