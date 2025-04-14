import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  // const Cabecalho({super.key});

  @override
  Widget build(BuildContext context) {
    return 
      SizedBox(
            width: double.infinity,
            child: Image(image: AssetImage('assets/logo.jpg'))
      ); 
  }

  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
