import '../model/question.dart';
import '../model/quiz.dart';

List<Question> get getInitialQuestions {
  return [
    Question(
      title: 'What is the primary language used for Flutter development?',
      choices: ['Java', 'Swift', 'Dart', 'Kotlin'],
      goodChoice: 'Dart',
    ),
    Question(
      title: 'What widget is used to manage state that can change over time?',
      choices: ['StatelessWidget', 'Container', 'Text', 'StatefulWidget'],
      goodChoice: 'StatefulWidget',
    ),
  ];
}

Quiz createNewQuiz() {
  return Quiz(questions: getInitialQuestions);
}