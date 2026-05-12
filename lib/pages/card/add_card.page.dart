import 'package:card_quiz/core/app_dependencies.dart';
import 'package:card_quiz/models/quiz_card.model.dart';
import 'package:card_quiz/stores/deck.store.dart';
import 'package:flutter/material.dart';

class AddCardPage extends StatefulWidget {
  final String deckId;

  const AddCardPage({super.key, required this.deckId});

  @override
  State<AddCardPage> createState() => _AddCardPageState();
}

class _AddCardPageState extends State<AddCardPage> {
  final TextEditingController _questionController = TextEditingController();
  final TextEditingController _answerController = TextEditingController();
  final DeckStore _deckStore = AppDependencies.deckStore;

  @override
  void dispose() {
    _questionController.dispose();
    _answerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Novo Cartão',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            TextField(
              controller: _questionController,
              decoration: InputDecoration(
                labelText: 'Pergunta',
                labelStyle: TextStyle(color: Colors.black),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 2),
                ),
              ),
            ),
            const SizedBox(height: 30),
            TextField(
              controller: _answerController,
              keyboardType: TextInputType.multiline,
              minLines: 3,
              maxLines: null,
              decoration: InputDecoration(
                labelText: 'Resposta',
                labelStyle: TextStyle(color: Colors.black),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 2),
                ),
              ),
            ),
            const SizedBox(height: 40),
            OutlinedButton(
              onPressed: () async {
                final question = _questionController.text.trim();
                final answer = _answerController.text.trim();

                if (question.isEmpty || answer.isEmpty) {
                  return;
                }

                final card = QuizCard(question: question, answer: answer);
                await _deckStore.addCardToDeck(widget.deckId, card);

                if (!context.mounted) {
                  return;
                }
                Navigator.of(context).pop();
              },
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.black),
                minimumSize: const Size(220, 50),
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6.0),
                ),
              ),
              child: const Text(
                'Adicionar',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
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
