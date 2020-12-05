import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() quandoReiniciarQuestionario;

  Resultado(this.pontuacao, this.quandoReiniciarQuestionario);

  String get fraseResultado {
    if (pontuacao < 4) {
      return 'Você está precisando conhecer melhor a terrinha. Que Tal comer uma panelada no barracão?';
    } else if (pontuacao < 7) {
      return 'Você conhece Uruburetama, mas está a um tempinho sem ir na festa da banana';
    } else if (pontuacao < 9) {
      return 'Parabéns, você sabe quase tudo de Uruburetama. Merece um Sanduíche do  Miguel ou um pastel das guarita';
    } else {
      return 'Nossa, você sabe tudo da terrinha. J deve ter pulado muito da galeria do açude';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: <Widget>[
        Text(fraseResultado, style: TextStyle(fontSize: 28)),
        FlatButton(
          child: Text(
            'Reiniciar',
            style: TextStyle(fontSize: 18),
          ),
          textColor: Colors.blue,
          onPressed: this.quandoReiniciarQuestionario,
        )
      ],
    ));
  }
}
