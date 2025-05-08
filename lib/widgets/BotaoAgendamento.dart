import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tati_unhas_e_beleza_flutter/widgets/agendamento/Agendamento.dart';
import 'package:tati_unhas_e_beleza_flutter/widgets/login/Auth.dart';
import 'package:tati_unhas_e_beleza_flutter/widgets/login/PaginaLoginCadastro.dart';

class BotaoAgendamento extends StatelessWidget {
  const BotaoAgendamento({super.key});


  @override
  Widget build(BuildContext context) {
    final User? user = Auth().currentUser;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 5),
          child: ElevatedButton(
            onPressed: () {
              if (user == null)
              {
                 Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginCadastro(),
                  ),
                );
              } else {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Agendamento()
                  )
                );
                Text('Estou chegando lá');
              }
             
            },
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(Color.fromARGB(255, 255, 230, 240)),
              shape: WidgetStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4)
              ))
            ), 
            child: Text("Agendar horário", style: TextStyle(color: Colors.black),),
          ),
        )
      ],
    );
  }
}