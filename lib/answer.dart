import 'package:flutter/material.dart';

class answer extends StatelessWidget {
  final String text;
  final void Function() toAnswer;

  const answer(this.text, this.toAnswer, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      
      margin: EdgeInsets.only(bottom: 5, left: 40, right: 40),
      width: double.infinity,
      height: 45,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 48, 188, 231),
          foregroundColor: const Color.fromARGB(255, 0, 0, 0),
        ),

        onPressed: toAnswer,
        child: Text(
          
          text,
          style: TextStyle(
            fontSize: 16,
          ),
          
          ),
      ),

    );
  }
}