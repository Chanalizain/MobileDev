import 'question.dart';

class Answer {
  final String answerChoice; 
  
  final Question question; 

  Answer({required this.answerChoice, required this.question});

  bool isCorrect() {
    return answerChoice == question.goodChoice;
  }
}