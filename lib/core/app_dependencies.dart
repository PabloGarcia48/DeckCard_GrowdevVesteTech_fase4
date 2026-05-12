import 'package:card_quiz/repositories/deck.repository.dart';
import 'package:card_quiz/stores/deck.store.dart';

class AppDependencies {
  AppDependencies._();

  static final DeckStore deckStore = DeckStore(DeckRepository.fromHive());
}
