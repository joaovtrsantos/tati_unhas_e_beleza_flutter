import 'package:flutter/material.dart';

class SubtextoSlogan extends StatelessWidget {
  const SubtextoSlogan({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Oferecemos serviços de manicure e \n cuidados de beleza para sua beleza única",
          textAlign: TextAlign.center,
          )
      ]
    );
      
  }
}