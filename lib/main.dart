import 'package:card_quiz/models/deck.model.dart';
import 'package:card_quiz/models/quiz_card.model.dart';
import 'package:card_quiz/repositories/deck.repository.dart';
import 'package:card_quiz/pages/home/home.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(QuizCardAdapter());
  Hive.registerAdapter(DeckAdapter());
  await Hive.openBox<Deck>(DeckRepository.boxName);

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Meus Cards",
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: const Home(),
    );
  }
}
