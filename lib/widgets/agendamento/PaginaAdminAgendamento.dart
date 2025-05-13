import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PaginaAdminAgendamentos extends StatefulWidget {

  const PaginaAdminAgendamentos({super.key});

  @override
  State<PaginaAdminAgendamentos> createState() => _PaginaAdminAgendamentosState();
}

class _PaginaAdminAgendamentosState extends State<PaginaAdminAgendamentos> {
  final DateTime hoje = DateTime.now();

  Stream<QuerySnapshot> obterAgendamentos() {
    final hojeSemHora = DateTime(hoje.year, hoje.month, hoje.day);
    return FirebaseFirestore.instance
        .collection('Agendamentos')
        .where('data', isGreaterThanOrEqualTo: hojeSemHora)
        .orderBy('data')
        .snapshots();
  }

  Future<void> excluirAgendamento(String id, BuildContext context) async {
    final confirmacao = await showDialog<bool>(
      context: context,
      builder:
          (_) => AlertDialog(
            title: Text("Excluir Agendamento"),
            content: Text("Tem certeza que deseja excluir este agendamento?"),
            actions: [
              TextButton(
                child: Text("Cancelar"),
                onPressed: () => Navigator.pop(context, false),
              ),
              TextButton(
                child: Text("Excluir"),
                onPressed: () => Navigator.pop(context, true),
              ),
            ],
          ),
    );
    if (confirmacao == true) {
      await FirebaseFirestore.instance
          .collection('Agendamentos')
          .doc(id)
          .delete();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Agendamentos")),
      body: StreamBuilder<QuerySnapshot>(
        stream: obterAgendamentos(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Erro ao carregar.'));
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          final agendamentos = snapshot.data!.docs;
          if (agendamentos.isEmpty) {
            return Center(child: Text('Nenhum agendamento a partir de hoje.'));
          }

          return ListView.builder(
            itemCount: agendamentos.length,
            itemBuilder: (_, i) {
              final doc = agendamentos[i];
              final dataHora = (doc['data'] as Timestamp).toDate();
              final dataStr =
                  "${dataHora.day}/${dataHora.month} ${dataHora.hour.toString().padLeft(2, '0')}:${dataHora.minute.toString().padLeft(2, '0')}";

              return Card(
                child: ListTile(
                  title: Text("${doc['clienteNome']} - $dataStr"),
                  subtitle: Text("${doc['servico']}"),
                  trailing: IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () => excluirAgendamento(doc.id, context),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
