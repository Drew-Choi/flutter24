import 'package:fir_adv_basics/data/questions.dart';
import 'package:fir_adv_basics/question_summary.dart';
import 'package:flutter/material.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key, required this.chosenAnswers});

  final List<String> chosenAnswers;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswers[i],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((data) {
      return data['correct_answer'] == data['user_answer'];
    }).length;

    return Container(
      margin: const EdgeInsets.all(40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
              'You answered  $numCorrectQuestions out of $numTotalQuestions questions correctly!'),
          const SizedBox(height: 30),
          QuestionSummary(summaryData: summaryData),
          const SizedBox(height: 30),
          TextButton(
            onPressed: () {},
            child: const Text('Restart Quiz!'),
          )
        ],
      ),
    );
  }
}
