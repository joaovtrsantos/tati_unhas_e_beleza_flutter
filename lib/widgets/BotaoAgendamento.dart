import 'package:flutter/material.dart';

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
            onPressed: () => (),
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(Color.fromARGB(255, 245, 200, 230)),
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