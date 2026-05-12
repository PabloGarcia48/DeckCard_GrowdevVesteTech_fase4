import 'package:card_quiz/models/quiz_card.model.dart';
import 'package:hive/hive.dart';

part 'deck.model.g.dart';

@HiveType(typeId: 1)
class Deck {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final List<QuizCard> cards;

  const Deck({required this.id, required this.title, required this.cards});

  int get cardsCount => cards.length;
}
