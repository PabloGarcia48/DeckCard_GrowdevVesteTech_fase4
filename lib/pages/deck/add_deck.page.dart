import 'package:card_quiz/stores/deck.store.dart';
import 'package:flutter/material.dart';

class AddDeckPage extends StatefulWidget {
  final DeckStore store;

  const AddDeckPage({super.key, required this.store});

  @override
  State<AddDeckPage> createState() => _AddDeckPageState();
}

class _AddDeckPageState extends State<AddDeckPage> {
  final TextEditingController _titleController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Novo Deck',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Qual é o título do seu novo deck?",
            style: const TextStyle(fontSize: 50, fontWeight: FontWeight.w500),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
              controller: _titleController,
              decoration: InputDecoration(
                labelText: 'Título do Deck',
                labelStyle: TextStyle(color: Colors.black),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 2),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          OutlinedButton(
            onPressed: () async {
              final title = _titleController.text.trim();
              if (title.isEmpty) {
                return;
              }

              await widget.store.addDeck(title);
              if (!context.mounted) {
                return;
              }
              Navigator.of(context).pop();
            },
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: Colors.black),
              minimumSize: const Size(150, 50),
              backgroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6.0),
              ),
            ),
            child: const Text(
              'Adicionar',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
