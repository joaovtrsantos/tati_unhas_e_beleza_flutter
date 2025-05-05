import 'package:flutter/material.dart';

class InputFormulario extends StatelessWidget {
  const InputFormulario(this.controlador, {super.key});

  final TextEditingController? controlador;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 335,
      height: 52,
      child: TextField(
        controller: controlador,
        decoration: const InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
      ),
    );
  }
}