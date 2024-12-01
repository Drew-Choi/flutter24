import 'package:fir_adv_basics/data/questions.dart';
import 'package:fir_adv_basics/questions_screen.dart';
import 'package:fir_adv_basics/results_screen.dart';
import 'package:fir_adv_basics/start_screen.dart';
import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  var activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'results-screen';
      });
    }
  }

  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.purple,
                Colors.indigo,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Center(
            child: activeScreen == 'start-screen'
                ? StartScreen(switchScreen)
                : activeScreen == 'questions-screen'
                    ? QuestionsScreen(onSelectAnswer: chooseAnswer)
                    : ResultsScreen(chosenAnswers: selectedAnswers),
          ),
        ),
      ),
    );
  }
}
