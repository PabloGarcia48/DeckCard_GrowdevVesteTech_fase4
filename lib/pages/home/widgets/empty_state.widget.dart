import 'package:flutter/material.dart';

class EmptyState extends StatelessWidget {
  final VoidCallback onAddDeck;

  const EmptyState({super.key, required this.onAddDeck});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/no_decks.png', width: 300),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: TextButton(
            style: TextButton.styleFrom(
              side: BorderSide(color: Colors.grey),
              minimumSize: const Size(double.infinity, 60),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6.0),
              ),
            ),
            onPressed: () {
              onAddDeck();
            },
            child: const Text(
              'Adicionar deck',
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
          ),
        ),
      ],
    );
  }
}
