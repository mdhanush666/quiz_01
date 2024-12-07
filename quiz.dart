import 'package:flutter/material.dart';
import 'package:quiz_app/quiz_01/data/questions.dart';
import 'package:quiz_app/quiz_01/question_screen.dart';
import 'package:quiz_app/quiz_01/result_screen.dart';
import 'package:quiz_app/quiz_01/start_screen.dart';

class Quiz extends StatefulWidget{
  const Quiz({super.key});

  @override
  State<Quiz> createState(){
    return _QuizState();
  }
  
}

class _QuizState extends State<Quiz>{

  Widget? activeScreen;
  List<String> selectedAnswers = [];

  @override
  void initState(){
    activeScreen = StartScreen(startQuiz: switchScreen,);
    super.initState();
  }


  void switchScreen(){
    setState(() {
      activeScreen = QuestionScreen(onSelectAnswer: getAnswer);
      selectedAnswers = [];
    });
  }

  void getAnswer(String answer){
    selectedAnswers.add(answer);
    if(selectedAnswers.length == questions.length){
      setState(() {
        activeScreen = ResultScreen(restart: switchScreen, chosenAnswers: selectedAnswers);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Quiz APP",
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 0, 0, 30),
                Color.fromARGB(255, 0, 0, 255),
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter
            )
          ),
          child: activeScreen,
        ),
      ),
    );
  }
}