import 'package:bazequiz/data/question.dart';
import 'package:bazequiz/question_summary/question_summary.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {super.key, required this.choosenAns, required this.restart});

  final List<String> choosenAns;

  final void Function() restart;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < choosenAns.length; i++) {
      summary.add({
        'question_no': i + 1,
        'question_text': questions[i].text,
        'question_ans': questions[i].answers[0],
        'current_answer': choosenAns[i],
        'isCorrect': questions[i].answers[0] == choosenAns[i]
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestion = questions.length;
    final numCorrect =
        summaryData.where((element) => element['isCorrect'] as bool);

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "You answered ${numCorrect.length} out of $numTotalQuestion question correcctly!",
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            // const Text("List question answerrd"),
            QuestionSummary(summaryData: getSummaryData()),
            TextButton.icon(
              onPressed: restart,
              icon: const Icon(
                Icons.refresh,
                color: Colors.white,
              ),
              label: const Text(
                "Restart",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
