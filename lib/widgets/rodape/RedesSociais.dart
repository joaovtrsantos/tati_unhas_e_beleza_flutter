import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RedesSociais extends StatelessWidget {
  const RedesSociais({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(flex: 4, child: Column(children: [Icon(FontAwesomeIcons.xTwitter)])),
        Expanded(flex: 4, child: Column(children: [Icon(FontAwesomeIcons.instagram)])),
        Expanded(flex: 4, child: Column(children: [Icon(FontAwesomeIcons.youtube)]))
      ],
    );
  }
}