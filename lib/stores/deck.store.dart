import 'package:card_quiz/models/deck.model.dart';
import 'package:card_quiz/models/quiz_card.model.dart';
import 'package:card_quiz/repositories/deck.repository.dart';
import 'package:mobx/mobx.dart';

class DeckStore {
  final DeckRepository _repository;

  DeckStore(this._repository);

  final ObservableList<Deck> decks = ObservableList<Deck>();

  final Observable<bool> _isLoading = Observable<bool>(false);

  bool get isLoading => _isLoading.value;

  bool get isEmpty => !isLoading && decks.isEmpty;

  Future<void> loadDecks() async {
    _isLoading.value = true;
    final storedDecks = _repository.findAll();
    runInAction(() {
      decks
        ..clear()
        ..addAll(storedDecks);
      _isLoading.value = false;
    });
  }

  Future<void> addDeck(String title) async {
    final normalizedTitle = title.trim();
    if (normalizedTitle.isEmpty) {
      return;
    }

    final deck = Deck(
      id: DateTime.now().microsecondsSinceEpoch.toString(),
      title: normalizedTitle,
      cards: const [],
    );

    await _repository.save(deck);
    runInAction(() {
      decks.add(deck);
    });
  }

  Future<void> addCardToDeck(String deckId, QuizCard card) async {
    final deckIndex = decks.indexWhere((d) => d.id == deckId);
    if (deckIndex == -1) {
      return;
    }

    final currentDeck = decks[deckIndex];
    final updatedCards = [...currentDeck.cards, card];
    final updatedDeck = Deck(
      id: currentDeck.id,
      title: currentDeck.title,
      cards: updatedCards,
    );

    await _repository.save(updatedDeck);
    runInAction(() {
      decks[deckIndex] = updatedDeck;
    });
  }
}
