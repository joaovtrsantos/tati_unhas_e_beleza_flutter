import 'package:flutter/material.dart';

class InputFormulario extends StatelessWidget {
  const InputFormulario(this.controlador, {this.isSenha = false, super.key});

  final TextEditingController? controlador;
  final bool isSenha;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 335,
      height: 52,
      child: TextField(
        controller: controlador,
        obscureText: isSenha ? true :  false,
        decoration: const InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
      ),
    );
  }
}