import 'package:flutter/material.dart';
import 'package:tati_unhas_e_beleza_flutter/widgets/login/Login.dart';

class BotaoAgendamento extends StatelessWidget {
  const BotaoAgendamento({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 5),
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context, 
                MaterialPageRoute(builder: (context) => const Login())
              );
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