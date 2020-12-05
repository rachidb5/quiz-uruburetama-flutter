import 'package:flutter/material.dart';
import 'questionario.dart';
import 'resultado.dart';

main() {
  runApp(new PerguntaApp());
}

class _PerguntaAppState extends State<PerguntaApp> {
  int _perguntaSelecionada = 0;
  int _pontuacaoTotal = 0;
  final List<Map<String, Object>> _perguntas = const [
    {
      'texto': 'Qual é o ponto mais alto de Uruburetama?',
      'respostas': [
        {'texto': 'Serra do retiro', 'nota': 1},
        {'texto': 'Santa luzia', 'nota': 0},
        {'texto': 'Serra do pau alto', 'nota': 0},
        {'texto': 'Bananal', 'nota': 0},
      ]
    },
    {
      'texto': 'Quem foi o primeiro prefeito eleito de Uruburetama?',
      'respostas': [
        {'texto': 'Eduardo Ferreira Gomes', 'nota': 0},
        {'texto': 'Antonio de Paula Sales', 'nota': 1},
        {'texto': 'José de Arimateia Barbosa', 'nota': 0},
        {'texto': 'José Renato Bastos Braga', 'nota': 0},
      ]
    },
    {
      'texto': 'Além da sede, Uruburetama tem quantos distritos?',
      'respostas': [
        {'texto': '3', 'nota': 0},
        {'texto': '4', 'nota': 1},
        {'texto': '7', 'nota': 0},
        {'texto': '18', 'nota': 0},
      ]
    },
    {
      'texto': 'Em que data foi fundado o município de Uruburetama?',
      'respostas': [
        {'texto': '1 de agosto de 1980', 'nota': 0},
        {'texto': '1 de agosto de 1964', 'nota': 0},
        {'texto': '1 de agosto de 1607', 'nota': 0},
        {'texto': '1 de agosto de 1890', 'nota': 1},
      ]
    },
    {
      'texto':
          'Qual tribo indigena ocupou o território que hoje é de Uruburetama?',
      'respostas': [
        {'texto': 'Tremembé', 'nota': 0},
        {'texto': 'Tapebas', 'nota': 0},
        {'texto': 'Guanacés', 'nota': 1},
        {'texto': 'Goytacá', 'nota': 0},
      ]
    },
    {
      'texto': 'Qual é o significado de Uruburetama?',
      'respostas': [
        {'texto': 'Serra dos urubus', 'nota': 0},
        {'texto': 'Terra dos urubus', 'nota': 1},
        {'texto': 'Urubus alucinados', 'nota': 0},
        {'texto': 'Terra da banana', 'nota': 0},
      ]
    },
    {
      'texto': 'Qual santo é o padroeiro de Uruburetama?',
      'respostas': [
        {'texto': 'São João Batista', 'nota': 1},
        {'texto': 'Santa luzia', 'nota': 0},
        {'texto': 'São Judas Tadeu', 'nota': 0},
        {'texto': 'São João', 'nota': 0},
      ]
    },
    {
      'texto': 'Qual municipios faz divisa com Uruburetama?',
      'respostas': [
        {'texto': 'Irauçuba', 'nota': 0},
        {'texto': 'Canindé', 'nota': 0},
        {'texto': 'Umirim', 'nota': 1},
        {'texto': 'Nova York', 'nota': 0},
      ]
    },
    {
      'texto': 'Qual dessa NÃO é uma localidade de Uruburetama?',
      'respostas': [
        {'texto': 'Sitio pau alto', 'nota': 0},
        {'texto': 'Água sumida', 'nota': 0},
        {'texto': 'Lagoa seca', 'nota': 1},
        {'texto': 'Bananal', 'nota': 0},
      ]
    },
    {
      'texto': 'Qual é o distrito mais antigo de Uruburetama?',
      'respostas': [
        {'texto': 'Itacolomy', 'nota': 0},
        {'texto': 'Santa luzia', 'nota': 1},
        {'texto': 'Retiro', 'nota': 0},
        {'texto': 'Mundaú', 'nota': 0},
      ]
    },
  ];

  void _responder(int pontuacao) {
    setState(() {
      _perguntaSelecionada++;
      _pontuacaoTotal += pontuacao;
    });
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('Perguntas'),
      ),
      body: temPerguntaSelecionada
          ? Questionario(
              perguntas: _perguntas,
              perguntaSelecionada: _perguntaSelecionada,
              responder: _responder,
            )
          : Resultado(this._pontuacaoTotal, this._reiniciarQuestionario),
    ));
  }
}

class PerguntaApp extends StatefulWidget {
  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
