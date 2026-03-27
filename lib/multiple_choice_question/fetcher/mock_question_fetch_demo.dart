import 'question_fetch.dart';
import '../mc_question.dart';

class MockQuestionFetch extends QuestionFetch {
  static final List<MCQuestion> _questions = [
    MCQuestion(
      "Geography",
      "What is the capital of France?",
      ["Paris", "London", "Berlin", "Madrid"],
      0, 
    ),
    MCQuestion("Science", "What planet is closest to the Sun?", [
      "Venus",
      "Mercury",
      "Earth",
      "Mars",
    ], 1),
    MCQuestion("Art", "Who painted the Mona Lisa?", [
      "Picasso",
      "Michelangelo",
      "Leonardo da Vinci",
      "Rembrandt",
    ], 2),
    MCQuestion("Geography", "What is the largest ocean?", [
      "Atlantic Ocean",
      "Indian Ocean",
      "Arctic Ocean",
      "Pacific Ocean",
    ], 3),
    MCQuestion("Math", "How many sides does a hexagon have?", [
      "5",
      "7",
      "6",
      "8",
    ], 2),
  ];

  int _index = 0;

  @override
  Future<MCQuestion> fetch() async {
    await Future.delayed(Duration(milliseconds: 300));
    final question = _questions[_index % _questions.length];
    _index++;
    return question;
  }
}
