import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String texto;
  final void Function() onSelected;

  Resposta(this.texto, this.onSelected);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
        child: Text(texto),
        onPressed: onSelected,
        color: Colors.blue,
        textColor: Colors.white,
      ),
      width: double.infinity,
    );
  }
}
