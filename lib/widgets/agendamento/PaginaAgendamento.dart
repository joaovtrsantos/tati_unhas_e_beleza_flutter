import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tati_unhas_e_beleza_flutter/widgets/PaginaInicial.dart';
import 'package:tati_unhas_e_beleza_flutter/widgets/login/Auth.dart';

class PaginaAgendamento extends StatefulWidget {
  @override
  _PaginaAgendamentoState createState() => _PaginaAgendamentoState();
}

class _PaginaAgendamentoState extends State<PaginaAgendamento> {
  DateTime? dataSelecionada;
  String? horaSelecionada;
  String? servicoSelecionado;
  bool _carregando = false;

  final horariosDisponiveis = [
    "08:00",
    "08:30",
    "09:00",
    "09:30",
    "10:00",
    "10:30",
    "11:00",
    "11:30",
    "14:00",
    "14:30",
    "15:00",
    "15:30",
    "16:00",
    "16:30",
    "17:00",
    "17:30",
  ];

  final servicos = ["Manicure", "Pedicure", "Manicure e Pedicure"];

  DateTime _proximaDataValida(DateTime data) {
    while (data.weekday == DateTime.sunday || data.weekday == DateTime.monday) {
      data = data.add(Duration(days: 1));
    }
    return data;
  }

  Future<bool> criacaoAgendamento() async {
    try {
      final authUser = Auth().currentUser;
      if (authUser == null) return false;

      final snapshot =
          await FirebaseFirestore.instance
              .collection('Usuarios')
              .where('email', isEqualTo: authUser.email)
              .limit(1)
              .get();

      if (snapshot.docs.isEmpty) return false;
      final usuario = snapshot.docs.first;

      final partesHora = horaSelecionada!.split(":");
      final hora = int.parse(partesHora[0]);
      final minuto = int.parse(partesHora[1]);
      final dataHoraFinal = DateTime(
        dataSelecionada!.year,
        dataSelecionada!.month,
        dataSelecionada!.day,
        hora,
        minuto,
      );

      await FirebaseFirestore.instance.collection('Agendamentos').add({
        'clienteNome': usuario['nome'],
        'criadoEm': DateTime.now(),
        'data': dataHoraFinal,
        'status': "pendente",
        'usuarioId': usuario.id,
        'servico': servicoSelecionado,
      });

      return true;
    } catch (_) {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Agendar Horário")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Selecione a Data"),
            ElevatedButton(
              onPressed: () async {
                final horarioEscolhido = await showDatePicker(
                  context: context,
                  initialDate: _proximaDataValida(DateTime.now()),
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now().add(Duration(days: 30)),
                  selectableDayPredicate: (DateTime date) {
                    return date.weekday != DateTime.sunday &&
                        date.weekday != DateTime.monday;
                  },
                );
                if (horarioEscolhido != null) {
                  setState(() => dataSelecionada = horarioEscolhido);
                }
              },
              child: Text(
                dataSelecionada == null
                    ? "Escolher data"
                    : "${dataSelecionada!.day}/${dataSelecionada!.month}/${dataSelecionada!.year}",
              ),
            ),
            SizedBox(height: 16),
            Text("Selecione o Horário"),
            Wrap(
              spacing: 8,
              children:
                  horariosDisponiveis.map((time) {
                    final isSelected = horaSelecionada == time;
                    return ChoiceChip(
                      label: Text(time),
                      selected: isSelected,
                      onSelected: (_) => setState(() => horaSelecionada = time),
                    );
                  }).toList(),
            ),
            SizedBox(height: 16),
            Text("Tipo de Serviço"),
            DropdownButton<String>(
              value: servicoSelecionado,
              hint: Text("Escolha um serviço"),
              isExpanded: true,
              items:
                  servicos.map((service) {
                    return DropdownMenuItem(
                      value: service,
                      child: Text(service),
                    );
                  }).toList(),
              onChanged: (value) => setState(() => servicoSelecionado = value),
            ),
            Spacer(),
            ElevatedButton(
              onPressed:
                  dataSelecionada != null &&
                          horaSelecionada != null &&
                          servicoSelecionado != null &&
                          !_carregando
                      ? () async {
                        if (_carregando) return;
                        setState(() => _carregando = true);
                        final sucesso = await criacaoAgendamento();
                        if (!mounted) return;
                        if (sucesso) {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const TatiUnhasEBelezaApp(),
                            ),
                            (route) => false,
                          );
                        } else {
                          setState(() => _carregando = false);
                        }
                      }
                      : null,
              style: ElevatedButton.styleFrom(minimumSize: Size.fromHeight(50)),
              child:
                  _carregando
                      ? CircularProgressIndicator(color: Colors.white)
                      : Text("Confirmar Agendamento"),
            ),
          ],
        ),
      ),
    );
  }
}
