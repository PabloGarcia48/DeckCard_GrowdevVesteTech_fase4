import 'package:hive/hive.dart';

part 'quiz_card.model.g.dart';

@HiveType(typeId: 0)
class QuizCard {
  @HiveField(0)
  final String question;

  @HiveField(1)
  final String answer;

  const QuizCard({required this.question, required this.answer});
}
