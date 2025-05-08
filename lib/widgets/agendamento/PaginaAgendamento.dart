import 'package:flutter/material.dart';

class PaginaAgendamento extends StatefulWidget {
  @override
  _PaginaAgendamentoState createState() => _PaginaAgendamentoState();
}

class _PaginaAgendamentoState extends State<PaginaAgendamento> {
  DateTime? dataSelecionada;
  String? horaSelecionada;
  String? servicoSelecionado;

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
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now().add(Duration(days: 30)),
                  selectableDayPredicate: (DateTime date){
                    return date.weekday != DateTime.sunday && date.weekday != DateTime.monday;
                  },
                );
                if (horarioEscolhido != null) setState(() => dataSelecionada = horarioEscolhido);
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
                          servicoSelecionado != null
                      ? () {
                        
                      }
                      : null,
              style: ElevatedButton.styleFrom(minimumSize: Size.fromHeight(50)),
              child: Text("Confirmar Agendamento"),
            ),
          ],
        ),
      ),
    );
  }
}