import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Informacoes extends StatelessWidget {
  const Informacoes({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.map),
              SizedBox(width: 8),
              Text('Rua João Manoel dos Santos, Joinville, SC, 89210713'),
            ],
          ),
          SizedBox(height: 16),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(FontAwesomeIcons.instagram),
              SizedBox(width: 8),
              Text('@tatyunhasebeleza'),
            ],
          ),
          SizedBox(height: 16),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.phone),
              SizedBox(width: 8),
              Text('47 98475529'),
            ],
          ),
        ],
      ),
    );
  }
}
