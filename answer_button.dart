import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget{
  const AnswerButton({super.key, required this.answerTxt, required this.onTap});

  final String answerTxt;
  final Function() onTap;
  
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(100, 0, 0, 30),
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30)
      ),
      onPressed: onTap, 
      child: Text(
        answerTxt, 
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w300)
      )
    );
  }
}