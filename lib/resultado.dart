import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() reiniciar;

  Resultado(this.pontuacao, this.reiniciar);

  String get congratulacoes {
    if (pontuacao < 8) {
      return 'Vergonha, desgraçaaaa!!!';
    } else if (pontuacao < 12) {
      return 'Mais ou menos! :)';
    } else if (pontuacao < 18) {
      return 'Ual! Mandou bem! :D';
    } else {
      return 'Pica das galáxias!!!!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            congratulacoes,
            style: TextStyle(fontSize: 28),
          ),
        ),
        FlatButton(
          child: Text(
            'Reiniciar',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          color: Colors.blue,
          textColor: Colors.white,
          onPressed: reiniciar,
        ),
      ],
    );
  }
}
