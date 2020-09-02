import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int perguntaSelecionada;
  final void Function(int) acao;
  final List<Map<String, Object>> opcoes;

  Questionario({
    @required this.perguntas,
    @required this.perguntaSelecionada,
    @required this.opcoes,
    @required this.acao,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Questao(perguntas[perguntaSelecionada]['texto']),
        ...opcoes
            .map((resp) =>
                Resposta(resp['texto'], () => acao(resp['pontuacao'])))
            .toList(),
      ],
    );
  }
}
