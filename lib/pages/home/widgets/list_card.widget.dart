import 'package:card_quiz/pages/deck/deck_detail.page.dart';
import 'package:card_quiz/models/deck.model.dart';
import 'package:flutter/material.dart';
import 'card.widget.dart';

class ListCard extends StatelessWidget {
  final List<Deck> decks;

  const ListCard({super.key, required this.decks});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: decks.length,
      itemBuilder: (context, index) {
        final deck = decks[index];

        return CardWidget(
          title: deck.title,
          cardsCount: deck.cardsCount,
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => DeckDetailPage(deckId: deck.id),
              ),
            );
          },
        );
      },
    );
  }
}
