import 'package:my_first_project/domain/quiz.dart';
import 'package:test/test.dart';

main() {
  // Create 2 questions and the quiz
  Question q1 =
      Question(title: "2+2", choices: ["1", "2", "4"], goodChoice: {"4": 5});

  Question q2 =
      Question(title: "2+3", choices: ["1", "2", "5"], goodChoice: {"5": 5});

  Quiz quiz = Quiz(questions: [q1, q2]);
  Player player = Player("Liza");

  test('All answers are good (100%)', () {
    // Create the answer here
    Answer a1 = Answer(question: q1, answerChoice: "4", player:"Liza");
    Answer a2 = Answer(question: q2, answerChoice: "5",player:"Liza");

    player.answers = [a1, a2];
    quiz.addPlayer(player);

    // Check something
    expect(player.getScoreInPercentage(quiz.questions), equals(100));
    expect(player.getScoreInPoint(), equals(10));
  });

  
}
