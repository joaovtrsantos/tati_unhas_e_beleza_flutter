import 'package:flutter/material.dart';

class Informacoes extends StatelessWidget {
  const Informacoes({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.email_outlined, size: 20),
            Padding(padding: EdgeInsets.only(left: 5)),
            Text(
              'tatyunhasbeleza@gmail.com',
              style: TextStyle(fontSize: 10),
            ), //TODO: Ajustar para o email real da empresa.
          ],
        ),
        Row(
          children: [
            Icon(Icons.phone, size: 20),
            Padding(padding: EdgeInsets.only(left: 5)),
            Text(
              '47 98475-5297',
              style: TextStyle(fontSize: 10),
            ), //TODO: Ajustar para o email real da empresa.
          ],
        ),
         Row(
          children: [
            Icon(Icons.place, size: 20),
            Padding(padding: EdgeInsets.only(left: 5)),
            Text(
              'Rua João Manoel dos Santos,  86, Itaum, Joinville',
              style: TextStyle(fontSize: 10),
            ), //TODO: Ajustar para o email real da empresa.
          ],
        )
      ],
    );
  }
}