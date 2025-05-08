import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tati_unhas_e_beleza_flutter/widgets/PaginaInicial.dart';
import 'package:tati_unhas_e_beleza_flutter/widgets/login/Auth.dart';
import 'package:tati_unhas_e_beleza_flutter/widgets/login/PaginaLoginCadastro.dart';

class Cabecalho extends StatelessWidget implements PreferredSizeWidget {
  const Cabecalho({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        final estaLogado = snapshot.hasData;

        return AppBar(
          title: const Text(
            'TATY UNHAS & BELEZA',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: const Color.fromARGB(255, 255, 230, 240),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TatiUnhasEBelezaApp(),
                  ),
                );
              },
              icon: const Icon(Icons.home),
            ),
            IconButton(
              onPressed: () async {
                if (estaLogado) {
                  await Auth().signOut();
                  // Volta para tela inicial limpando a navegação
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TatiUnhasEBelezaApp(),
                    ),
                    (route) => false,
                  );
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginCadastro(),
                    ),
                  );
                }
              },
              icon: Icon(estaLogado ? Icons.logout : Icons.login),
            ),
          ],
        );
      },
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

