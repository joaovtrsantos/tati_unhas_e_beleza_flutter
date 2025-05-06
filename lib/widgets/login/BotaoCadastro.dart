import 'package:flutter/material.dart';

class BotaoCadastro extends StatelessWidget {
  const BotaoCadastro({
    this.isLogin = true,
    required this.onPressed,
    super.key,
  });

  final bool isLogin;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 335,
      height: 52,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(Colors.white),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          ),
        ),
        child: Text(
          isLogin
              ? "Não tem conta? Cadastre-se."
              : "Já tem conta? Logue clicando aqui.",
          style: const TextStyle(color: Colors.black, fontSize: 15),
        ),
      ),
    );
  }
}
