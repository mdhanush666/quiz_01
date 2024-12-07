import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget{
  
  const QuestionsSummary(this.summary, {super.key});

  final List<Map<String, Object>> summary;

  @override
  Widget build(BuildContext context) {

    TextStyle questionTxt = const TextStyle(color: Colors.white, fontSize: 16);
    TextStyle userAnswerTxt = const TextStyle(color: Colors.blue, fontSize: 14);
    TextStyle crrtAnswerTxt = const TextStyle(color: Colors.green, fontSize: 14);

    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          
          children: summary.map((data){
            return Row(    
                   
              children: [ 

                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Column(
                      children: [
                        Text(data["question"] as String, style: questionTxt, textAlign: TextAlign.center),

                        Text(data["user_answer"] as String, style: userAnswerTxt, textAlign: TextAlign.center),
                        
                        Text(data["correct_answer"] as String, style: crrtAnswerTxt, textAlign: TextAlign.center),

                      ],
                    ),
                  ),
                )
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}