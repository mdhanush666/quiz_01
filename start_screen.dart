import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget{
  const StartScreen({super.key, required this.startQuiz});

  final Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Image.asset("assets/quiz-logo.png", width: 300),
          const SizedBox(height: 30),

          Text(
            "Quiz Game in Flutter",
            style: GoogleFonts.poppins(color: Colors.white, fontSize: 24),
            ),
          const SizedBox(height: 30),

          OutlinedButton.icon(
            style: OutlinedButton.styleFrom(
              backgroundColor: Colors.transparent,
              foregroundColor: Colors.white
            ),
            onPressed: startQuiz, 
            label: const Text("Start Quiz"),
            icon: const Icon(Icons.arrow_forward),
          )

        ],
      ),
    );
  }
}