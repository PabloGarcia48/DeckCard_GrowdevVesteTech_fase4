import 'package:card_quiz/core/app_dependencies.dart';
import 'package:card_quiz/pages/deck/add_deck.page.dart';
import 'package:card_quiz/stores/deck.store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:card_quiz/pages/home/widgets/empty_state.widget.dart';
import 'package:card_quiz/pages/home/widgets/list_card.widget.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final DeckStore _deckStore = AppDependencies.deckStore;

  @override
  void initState() {
    super.initState();
    _deckStore.loadDecks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Decks')),
      body: Observer(
        builder: (context) {
          if (_deckStore.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (_deckStore.isEmpty) {
            return Center(
              child: EmptyState(
                onAddDeck: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => AddDeckPage(store: _deckStore),
                    ),
                  );
                },
              ),
            );
          }

          return ListCard(decks: _deckStore.decks.toList());
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => AddDeckPage(store: _deckStore),
            ),
          );
        },
        shape: const StadiumBorder(),
        backgroundColor: Colors.black,
        label: const Text(
          'Adicionar',
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
    );
  }
}
