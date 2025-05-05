import 'package:flutter/material.dart';

class LoginTitulo extends StatelessWidget {
  const LoginTitulo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
                  'Login',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                );
  }
}