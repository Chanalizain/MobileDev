import 'package:flutter/material.dart';
import '../../model/quiz.dart';
import '../widget/summaryItem.dart';

class ResultScreen extends StatelessWidget {
  final Quiz quiz;
  final int totalScore;
  // Parameter: OnRestart: voidCallback
  final VoidCallback onRestart;

  const ResultScreen({
    required this.quiz,
    required this.totalScore, 
    required this.onRestart, 
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    List<Widget> summaryItems = [];
    for (int i = 0; i < quiz.questions.length; i++) {
      summaryItems.add(
        SummaryItem(
          question: quiz.questions[i],
          userAnswer: i < quiz.userAnswers.length ? quiz.userAnswers[i] : null,
        ),
      );
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Quiz Finished!',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        Text(
          'Your Score: $totalScore / ${quiz.questions.length}', // Display the score
          style: const TextStyle(fontSize: 28, color: Colors.green),
        ),
        const SizedBox(height: 30),
          // Display the detailed summary
          ...summaryItems,
        const SizedBox(height: 30),
        ElevatedButton.icon(
          onPressed: onRestart, 
          icon: const Icon(Icons.refresh),
          label: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Text('Restart Quiz', style: TextStyle(fontSize: 18)),
          ),
        ),
      ],
    );
  }
}