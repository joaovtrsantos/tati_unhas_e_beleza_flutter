import 'package:flutter/material.dart';

class Cabecalho extends StatelessWidget implements PreferredSizeWidget {
  const Cabecalho({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: AppBar(
        title: Text('TATY UNHAS & BELEZA', style: TextStyle(color: Colors.black)),
        backgroundColor: Color.fromARGB(255, 255, 230, 240),
        centerTitle: true,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
