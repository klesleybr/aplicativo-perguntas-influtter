import 'package:flutter/material.dart';

class question extends StatelessWidget {
  final String texto;

  const question(this.texto, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),
      child:
        Text(
          texto,
          style: TextStyle(fontSize: 30),
          textAlign: TextAlign.center,
        )
    );
  }

}