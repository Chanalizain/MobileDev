import 'package:flutter/material.dart';
import '../../model/quiz.dart';
import '../../model/answer.dart';

class QuestionScreen extends StatefulWidget {
  // quiz object (to get questions)
  final Quiz quiz;
  // Callback to handle submitting an answer (moves the app logic forward)
  final Function(Answer) onAnswerSubmitted;

  const QuestionScreen({
    required this.quiz, 
    required this.onAnswerSubmitted,
    super.key,
  });

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int _currentQuestionIndex = 0;

  void _answerQuestion(String selectedChoice) {
    final currentQuestion = widget.quiz.questions[_currentQuestionIndex];
    final answer = Answer(
      answerChoice: selectedChoice,
      question: currentQuestion,
    );
    
    widget.onAnswerSubmitted(answer);

    if (_currentQuestionIndex < widget.quiz.questions.length - 1) {
      setState(() {
        _currentQuestionIndex++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = widget.quiz.questions[_currentQuestionIndex];

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Question ${_currentQuestionIndex + 1}/${widget.quiz.questions.length}:',
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 10),
          Text(
            currentQuestion.title,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          // Map choices to buttons
          ...currentQuestion.choices.map((choice) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: ElevatedButton(
                onPressed: () => _answerQuestion(choice), 
                child: Text(choice),
              ),
            );
          }),
        ],
      ),
    );
  }
}
