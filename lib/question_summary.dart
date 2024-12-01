import 'package:flutter/material.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary({super.key, required this.summaryData});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
            (data) {
              return Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 30,
                        width: 30,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: data['correct_answer'] == data['user_answer']
                              ? const Color.fromARGB(255, 83, 115, 255)
                              : const Color.fromARGB(255, 255, 83, 83),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Text(
                            ((data['question_index'] as int) + 1).toString()),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              data['question'] as String,
                              style: const TextStyle(color: Colors.white),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              data['user_answer'] as String,
                              style: const TextStyle(
                                  color: Color.fromARGB(141, 255, 255, 255)),
                            ),
                            Text(
                              data['correct_answer'] as String,
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 36, 13, 128),
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  )
                ],
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
