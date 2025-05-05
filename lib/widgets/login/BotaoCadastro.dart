import 'package:flutter/material.dart';

class BotaoCadastro extends StatelessWidget {
  const BotaoCadastro({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 335,
      height: 52,
      child: ElevatedButton(
        onPressed: null,
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(Colors.white),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          ),
        ),
        child: Text(
          "Não tem conta? Cadastre-se",
          style: TextStyle(color: Colors.black, fontSize: 15),
        ),
      ),
    );
  }
}