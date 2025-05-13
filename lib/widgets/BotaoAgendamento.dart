import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tati_unhas_e_beleza_flutter/widgets/agendamento/PaginaAdminAgendamento.dart';
import 'package:tati_unhas_e_beleza_flutter/widgets/agendamento/PaginaAgendamento.dart';
import 'package:tati_unhas_e_beleza_flutter/widgets/login/Auth.dart';
import 'package:tati_unhas_e_beleza_flutter/widgets/login/PaginaLoginCadastro.dart';

class BotaoAgendamento extends StatefulWidget {
  const BotaoAgendamento({super.key});

  @override
  _BotaoAgendamentoState createState() => _BotaoAgendamentoState();
}

class _BotaoAgendamentoState extends State<BotaoAgendamento> {
  bool _clicado = false;

  Future<bool> isAdmin(String? email) async {
    if (email == null) return false;

    final usuarioSnapshot =
        await FirebaseFirestore.instance
            .collection('Usuarios')
            .where('email', isEqualTo: email)
            .limit(1)
            .get();

    final usuario = usuarioSnapshot.docs.first;
    return usuario['admin'];
  }

  @override
  Widget build(BuildContext context) {
    final User? user = Auth().currentUser;

    return FutureBuilder<bool>(
      future: isAdmin(user?.email),
      builder: (context, snapshot) {
        final bool isAdmin = snapshot.data ?? false;

        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed:
                  _clicado
                      ? null
                      : () async {
                        setState(() => _clicado = true);
                        if (user == null) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const LoginCadastro(),
                            ),
                          );
                        } else {
                          final destino =
                              isAdmin
                                  ? PaginaAdminAgendamentos()
                                  : PaginaAgendamento();

                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => destino),
                          );
                        }
                        setState(() => _clicado = false);
                      },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 255, 230, 240),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              child: Text(
                isAdmin ? "Lista de agendamentos" : "Agendar horário",
                style: const TextStyle(color: Colors.black),
              ),
            ),
          ],
        );
      },
    );
  }
}
