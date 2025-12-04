import 'package:flutter/material.dart';
import '../../model/question.dart';
import '../../model/answer.dart';

class SummaryItem extends StatelessWidget {
  final Question question;
  final Answer? userAnswer;

  const SummaryItem({
    required this.question,
    this.userAnswer,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    String? userChoice = userAnswer?.answerChoice;
    
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            // ignore: deprecated_member_use
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            question.title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          
          // Choices and Feedback
          ...question.choices.map((choice) {
          
            Color color = Colors.black; 
            IconData? icon;

            if (choice == question.goodChoice) {
              icon = Icons.check_circle;
              if (userChoice == choice) {
                color = Colors.green; 
              } else {
                color = color; 
              }
            } else if (choice == userChoice) {
              icon = Icons.cancel;
              color = Colors.red;
            }

            return Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Row(
                children: [
                  Icon(icon, color: color, size: 16),
                  const SizedBox(width: 8),

                  Expanded(
                    child: Text(
                      choice,
                      style: TextStyle(
                        color: color,
                        fontWeight: color == Colors.black ? FontWeight.normal : FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}