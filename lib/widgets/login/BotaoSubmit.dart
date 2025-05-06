import 'package:flutter/material.dart';

class BotaoSubmit extends StatelessWidget {
  const BotaoSubmit({required this.onPressed, required this.texto, super.key});

  final VoidCallback onPressed;
  final String texto;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 335,
      height: 52,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(
            Color.fromARGB(255, 255, 230, 240),
          ),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          ),
        ),
        child: Text(
          texto,
          style: TextStyle(color: Colors.black, fontSize: 25),
        ),
      ),
    );
  }
}
