import 'package:card_quiz/models/deck.model.dart';
import 'package:card_quiz/models/quiz_card.model.dart';

class QuizResult {
  final String cardId;
  final bool isCorrect;

  QuizResult({required this.cardId, required this.isCorrect});
}

class QuizStore {
  final Deck deck;

  int _currentIndex = 0;
  bool _showAnswer = false;
  final List<QuizResult> _results = [];

  QuizStore({required this.deck});

  int get currentIndex => _currentIndex;
  bool get showAnswer => _showAnswer;
  List<QuizResult> get results => _results;

  QuizCard get currentCard => deck.cards[_currentIndex];

  int get totalCards => deck.cards.length;
  int get currentNumber => _currentIndex + 1;

  bool get isLastCard => _currentIndex == deck.cards.length - 1;

  int get correctCount => _results.where((r) => r.isCorrect).length;

  int get incorrectCount => _results.where((r) => !r.isCorrect).length;

  double get percentageCorrect {
    if (_results.isEmpty) return 0;
    return (correctCount / _results.length) * 100;
  }

  void toggleShowAnswer() {
    _showAnswer = !_showAnswer;
  }

  void markCorrect() {
    _results.add(QuizResult(cardId: currentCard.question, isCorrect: true));

    if (!isLastCard) {
      _currentIndex++;
      _showAnswer = false;
    }
  }

  void markIncorrect() {
    _results.add(QuizResult(cardId: currentCard.question, isCorrect: false));

    if (!isLastCard) {
      _currentIndex++;
      _showAnswer = false;
    }
  }

  bool get isQuizFinished => _results.length == deck.cards.length;
}
