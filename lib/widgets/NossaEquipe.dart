import 'package:flutter/material.dart';

class NossaEquipe extends StatelessWidget {
  const NossaEquipe({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 440,
      padding: EdgeInsets.fromLTRB(32, 16, 32, 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Nossa Equipe',
            style: TextStyle(
              fontWeight: FontWeight.bold, 
              fontSize: 18
            ),
          ),
          SizedBox(height: 8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 10,
            children: [
              Expanded(
                flex: 3,
                child: CircleAvatar(
                  radius: 45,
                  backgroundImage: ResizeImage(AssetImage('assets/funcionaria1.jpg'), width: 100, height: 115),
                ),
              ),
              Expanded(
                flex: 9,
                child: Text(
                  "Nossa equipe é formada por profissionais experientes, dedicados a oferecer um atendimento de qualidade com carinho e atenção a cada detalhe.",
                  textAlign: TextAlign.justify,
                ) 
              )
            ],
          ),
          SizedBox(height: 16),
          Row(
            spacing: 10,
            children: [
               Expanded(
                flex: 9,
                child: Text(
                  "Somos uma equipe apaixonada por cuidar de você! Juntas, criamos um ambiente leve, acolhedor e cheio de boas energias.",
                  textAlign: TextAlign.justify,
                ),
              ),
              Expanded(
                flex: 3,
                child: CircleAvatar(
                  radius: 45,
                  backgroundImage: ResizeImage(
                    AssetImage('assets/funcionaria2.jpg'),
                    width: 70,
                    height: 115,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}