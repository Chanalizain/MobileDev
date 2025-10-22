import 'dart:io';

import '../domain/quiz.dart';

class QuizConsole {
  Quiz quiz;

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

      quiz.addPlayer(player);

      for (var question in quiz.questions) {
        print('\nQuestion: ${question.title}');
        print('Choices: ${question.choices}');

        stdout.write('Your answer: ');
        String? userInput = stdin.readLineSync();

        if (userInput != null && userInput.isNotEmpty) {
          Answer answer = Answer(
            question: question,
            answerChoice: userInput,
            player: player.name,
          );
          player.addAnswer(answer);
        } else {
          print('No answer entered. Skipping question.');
        }
      }

      print('\n$playerName: Your score in point is '
            '${player.getScoreInPoint()} points '
            '\n$playerName: Your score in percentage is '
            '(${player.getScoreInPercentage(quiz.questions)}%)\n');
    }


  }
}
 