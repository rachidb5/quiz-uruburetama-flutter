import 'package:flutter/material.dart';
import './resposta.dart';
import './questao.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int perguntaSelecionada;
  final void Function(int) responder;

  Questionario({
    @required this.perguntas,
    @required this.perguntaSelecionada,
    @required this.responder,
  });

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas = temPerguntaSelecionada
        ? perguntas.elementAt(perguntaSelecionada)['respostas']
        : null;

    return Center(
        child: Column(
      children: <Widget>[
        Questao(perguntas.elementAt(perguntaSelecionada)['texto']),
        ...respostas
            .map((resp) =>
                Resposta(resp['texto'], () => responder(resp['nota'])))
            .toList(),
      ],
    ));
  }
}
