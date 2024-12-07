import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/quiz_01/data/questions.dart';
import 'package:quiz_app/quiz_01/questions_summary.dart';

class ResultScreen extends StatelessWidget{
  const ResultScreen({super.key, required this.restart, required this.chosenAnswers});

  final Function() restart;
  final List<String> chosenAnswers;

  List<Map<String, Object>> getSummaryData(){
    List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        "question_index": '${i+1}',
        "question": questions[i].question,
        "correct_answer": questions[i].answers[0],
        "user_answer": chosenAnswers[i]
      });      
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {

    final summaryData = getSummaryData();
    final totalNumQuestion = questions.length;
    final crrtAnswers = summaryData.where((data){
      return data["user_answer"] == data["correct_answer"];
    }).length;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Text(
            "Your have answered $crrtAnswers questions correctly out of $totalNumQuestion",
            style: GoogleFonts.lato(fontSize: 30, color: Colors.white),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 50),

          QuestionsSummary(summaryData),

          const SizedBox(height: 30),

          TextButton(onPressed: restart, child: const Text("Restart Quiz", style: TextStyle(color: Colors.white, fontSize: 16)))
        ],
      ),
    );
  }
}