import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class RedesSociais extends StatelessWidget {
  const RedesSociais({super.key});

  Future<void> _abrirUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.min,      
      children: [
        IconButton(
          icon: Icon(FontAwesomeIcons.facebook, size: 30,),
          onPressed: () => _abrirUrl('https://www.facebook.com/Tatyunhasebeleza/'),
        ),
        IconButton(
          icon: Icon(FontAwesomeIcons.instagram, size: 30,),
          onPressed: () => _abrirUrl('https://www.instagram.com/tatyunhasebeleza/'),
        ),
      ],
    );
  }
}
