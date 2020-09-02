import 'package:flutter/material.dart';
import './questionario.dart';
import './resultado.dart';

main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  int _perguntaSelecionada = 0;
  int _pontuacaoTotal = 0;

  final _perguntas = const [
    {
      'texto': 'Qual sua cor favorita?',
      'resposta': [
        {'texto': 'Rosa', 'pontuacao': 10},
        {'texto': 'Amarelo', 'pontuacao': 5},
        {'texto': 'Bege', 'pontuacao': 3},
        {'texto': 'Turquesa', 'pontuacao': 1},
      ]
    },
    {
      'texto': 'Qual o seu animal favorito?',
      'resposta': [
        {'texto': 'Guaxinim', 'pontuacao': 10},
        {'texto': 'Zebra', 'pontuacao': 5},
        {'texto': 'Avestruz', 'pontuacao': 3},
        {'texto': 'Gambá', 'pontuacao': 1},
      ]
    },
    {
      'texto': 'Qual o seu instrutor favorito?',
      'resposta': [
        {'texto': 'Jailson', 'pontuacao': 10},
        {'texto': 'Roberto', 'pontuacao': 5},
        {'texto': 'Enzo', 'pontuacao': 3},
        {'texto': 'Valentina', 'pontuacao': 1},
      ]
    },
  ];

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  void _reiniciar() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  Widget build(BuildContext context) {
    // Modo mais imperativo:
    // for (String resposta in perguntas[_perguntaSelecionada]['resposta']) {
    //   respostas.add(Resposta(resposta, _responder));
    // }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                opcoes: temPerguntaSelecionada
                    ? _perguntas[_perguntaSelecionada]['resposta']
                    : null,
                acao: _responder,
              )
            : Resultado(_pontuacaoTotal, _reiniciar),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
