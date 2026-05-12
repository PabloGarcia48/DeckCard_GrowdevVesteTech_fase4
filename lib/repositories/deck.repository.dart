import 'package:card_quiz/models/deck.model.dart';
import 'package:hive/hive.dart';

class DeckRepository {
  static const boxName = 'decksBox';

  final Box<Deck> _box;

  DeckRepository(this._box);

  factory DeckRepository.fromHive() => DeckRepository(Hive.box<Deck>(boxName));

  List<Deck> findAll() => _box.values.toList();

  Future<void> save(Deck deck) async {
    await _box.put(deck.id, deck);
  }
}
