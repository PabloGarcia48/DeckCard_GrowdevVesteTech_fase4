import 'package:card_quiz/core/app_dependencies.dart';
import 'package:card_quiz/models/deck.model.dart';
import 'package:card_quiz/pages/card/add_card.page.dart';
import 'package:card_quiz/pages/quiz/quiz_aq.page.dart';
import 'package:card_quiz/stores/deck.store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class DeckDetailPage extends StatelessWidget {
  final String deckId;
  final DeckStore _deckStore = AppDependencies.deckStore;

  DeckDetailPage({super.key, required this.deckId});

  Deck? _findDeck() {
    try {
      return _deckStore.decks.firstWhere((deck) => deck.id == deckId);
    } catch (e) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Observer(
          builder: (_) {
            final deck = _findDeck();
            return Text(deck?.title ?? 'Deck');
          },
        ),
      ),
      body: Observer(
        builder: (_) {
          final deck = _findDeck();
          if (deck == null) {
            return const Center(child: Text('Deck não encontrado'));
          }
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 300,
                  child: Text(
                    deck.title,
                    overflow: TextOverflow.fade,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  '${deck.cardsCount} cartões',
                  style: const TextStyle(fontSize: 26),
                ),
                const SizedBox(height: 100),
                OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => AddCardPage(deckId: deck.id),
                      ),
                    );
                  },
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.black),
                    minimumSize: const Size(220, 60),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                  ),
                  child: const Text(
                    'Add Cartão',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                OutlinedButton(
                  onPressed: () {
                    if (deck.cards.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Adicione cartões antes de iniciar'),
                        ),
                      );
                      return;
                    }
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => QuizAQPage(deckId: deck.id),
                      ),
                    );
                  },
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.black),
                    minimumSize: const Size(220, 60),
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                  ),
                  child: const Text(
                    'Iniciar Quiz',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
