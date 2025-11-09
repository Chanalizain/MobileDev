import 'dart:io';

import '../domain/quiz.dart';

class QuizConsole {
  Quiz quiz;
  List<Submission> allSubmissions = [];

  List<Player> participants = [];

  QuizConsole({required this.quiz});

  void startQuiz() {

    while (true) {
      stdout.write('Enter player name (or empty to finish): ');
      String? playerName = stdin.readLineSync();

      if (playerName == null || playerName.isEmpty) {
        print('\nNo more players. Quiz ended.');
        break;
      }

      Player player = Player(playerName);
      participants.add(player);

      List<Answer> currentAnswers = [];

      for (var question in quiz.questions) {
        print('\nQuestion: ${question.title}');
        print('Choices: ${question.choices}');

        stdout.write('Your answer: ');
        String? userInput = stdin.readLineSync();

        Answer answer = Answer(
          question: question,
          answerChoice: userInput ?? '', 
        );
        currentAnswers.add(answer);
      }

      Submission submission = Submission(
        player: player,
        quiz: quiz,
        answers: currentAnswers,
      );
      
      allSubmissions.add(submission);

      print('\n--- ${player.name}\'s Attempt Results ---');
      print('Score in Points: ${submission.getScoreInPoint()} points');
      print('Score in Percentage: ${submission.getScoreInPercentage()}%\n');
    }
    }

}

 