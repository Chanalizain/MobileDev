import 'package:flutter/material.dart';
import 'model/quiz.dart';
import 'data/quiz.dart';
import 'model/answer.dart';
import 'ui/screen/question.dart';
import 'ui/screen/result.dart';
import 'ui/screen/start.dart';

void main() {
  runApp(const QuizApp());
}

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {

  int _activeScreenIndex = 0;
  late Quiz _currentQuiz;

  @override
  void initState() {
    super.initState();
    _initializeQuiz();
  }

  void _initializeQuiz() {
     _currentQuiz = createNewQuiz(); 
  }

  void _startQuiz() {
    setState(() {
      _activeScreenIndex = 1; // 1 = QuestionScreen
    });
  }
  
  void _endQuiz() {
    setState(() {
      _activeScreenIndex = 2; // 2 = ResultScreen
    });
  }

  void _restartQuiz() {
    setState(() {
      _initializeQuiz();
      _activeScreenIndex = 0; // 0 = StartScreen
    });
  }
  @override
  Widget build(BuildContext context) {
    Widget screenWidget;

    if (_activeScreenIndex == 0) {
      screenWidget = StartScreen(
        onStart: _startQuiz,
      );
    } else if (_activeScreenIndex == 1) {
      screenWidget = QuestionScreen(
        quiz: _currentQuiz,
        onAnswerSubmitted: (Answer answer) {
          _currentQuiz.submitAnswer(answer);
          if (_currentQuiz.isComplete) {
            _endQuiz(); // Move to results 
          }
        },
      );
    } else {
      // Show Result Screen
      screenWidget = ResultScreen(
        quiz: _currentQuiz,
        totalScore: _currentQuiz.getScore(),
        onRestart: _restartQuiz,
      );
    }

    return MaterialApp(
      title: 'Flutter Quiz App',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 142, 203, 254),
        body: Center(child: screenWidget),
      ),
    );
  }
}