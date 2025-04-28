import 'package:flutter/material.dart';

class QuemSomos extends StatelessWidget {
  const QuemSomos({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 50),
      color: const Color.fromARGB(255, 255, 230, 240), // fundo rosa claro
      height: 237,
      width: 440,
      padding: const EdgeInsets.all(32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Quem somos",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const SizedBox(height: 8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  'Somos apaixonados por beleza e bem-estar! Nosso espaço foi criado para oferecer serviços de qualidade, com carinho, profissionalismo e atenção a cada detalhe. Aqui, cada cliente é única e especial. Seja bem-vinda(o) à nossa família!',
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 13),
                ),
              ),
              const SizedBox(width: 16),
              SizedBox(
                width: 107,
                height: 122,
                child: Image.asset('assets/rosto.png', fit: BoxFit.cover),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
