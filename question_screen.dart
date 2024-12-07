import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/quiz_01/answer_button.dart';
import 'package:quiz_app/quiz_01/data/questions.dart';

class QuestionScreen extends StatefulWidget{
  const QuestionScreen({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen>{

  var currentQuestionIndex = 0;

  void nextQuestion(String answer){
    widget.onSelectAnswer(answer);
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {

    final currentQuestion = questions[currentQuestionIndex];

    TextStyle questionTxt = GoogleFonts.lato(color: Colors.white, fontSize: 20);
    
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              currentQuestion.question, 
              textAlign: TextAlign.center,
              style: questionTxt
            ),
          ),

          const SizedBox(height: 20),

          ...currentQuestion.answers.map((answer){
            return Container(
              width: 300,
              margin: const EdgeInsets.only(bottom: 5),
              child: AnswerButton(answerTxt: answer, onTap: (){
                nextQuestion(answer);
              })
            );
          })


        ],
      ),
    );
  }
}