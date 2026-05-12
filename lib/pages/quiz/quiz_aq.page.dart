import 'package:card_quiz/core/app_dependencies.dart';
import 'package:card_quiz/pages/quiz/quiz_result.page.dart';
import 'package:card_quiz/stores/deck.store.dart';
import 'package:card_quiz/stores/quiz.store.dart';
import 'package:flutter/material.dart';

class QuizAQPage extends StatefulWidget {
  final String deckId;

  const QuizAQPage({super.key, required this.deckId});

  @override
  State<QuizAQPage> createState() => _QuizAQPageState();
}

class _QuizAQPageState extends State<QuizAQPage> {
  late final DeckStore _deckStore = AppDependencies.deckStore;
  late QuizStore _quizStore;

  @override
  void initState() {
    super.initState();
    _initializeQuiz();
  }

  void _initializeQuiz() {
    final deck = _deckStore.decks.firstWhere((d) => d.id == widget.deckId);
    _quizStore = QuizStore(deck: deck);
  }

  @override
  Widget build(BuildContext context) {
    if (_quizStore.isQuizFinished) {
      return QuizResultPage(correctCount: _quizStore.correctCount);
    }

    return Scaffold(
      appBar: AppBar(title: Text('Quiz: ${_quizStore.deck.title}')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                '${_quizStore.currentNumber}/${_quizStore.totalCards}',
                style: const TextStyle(fontSize: 24),
              ),
            ),
            const SizedBox(height: 60),
            Center(
              child: Text(
                _quizStore.showAnswer
                    ? _quizStore.currentCard.answer
                    : _quizStore.currentCard.question,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 40),
            TextButton(
              onPressed: () {
                setState(() {
                  _quizStore.toggleShowAnswer();
                });
              },
              child: Text(
                _quizStore.showAnswer
                    ? 'Visualizar Pergunta'
                    : 'Visualizar Resposta',
                style: const TextStyle(
                  color: Colors.red,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 60),
            OutlinedButton(
              onPressed: () {
                setState(() {
                  _quizStore.markCorrect();
                });
              },
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6.0),
                ),
                side: const BorderSide(color: Colors.green, width: 2),
                backgroundColor: Colors.green,
                minimumSize: const Size(200, 50),
              ),
              child: const Text(
                'Acertei :)',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 16),
            OutlinedButton(
              onPressed: () {
                setState(() {
                  _quizStore.markIncorrect();
                });
              },
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6.0),
                ),
                side: const BorderSide(color: Colors.red, width: 2),
                backgroundColor: Colors.red,
                minimumSize: const Size(200, 50),
              ),
              child: const Text(
                'Errei :(',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
