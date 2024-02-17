import 'package:bazequiz/answer_btn.dart';
import 'package:bazequiz/data/question.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key, required this.onSelectAns});

  final void Function(String ans) onSelectAns;

  @override
  State<QuestionScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen> {
  int currentQuestionIdx = 0;

  void onAnswerTap(String selectedAns) {
    widget.onSelectAns(selectedAns);
    setState(() {
      currentQuestionIdx++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final curerntQuestion = questions[currentQuestionIdx];
    return SizedBox(
      width: double.infinity,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 42),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              curerntQuestion.text,
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                  color: Colors.white, fontWeight: FontWeight.w700),
              // style: const TextStyle(
              //   color: Colors.white,
              //   fontWeight: FontWeight.w700,
              // ),
            ),
            const SizedBox(
              height: 32,
            ),
            ...curerntQuestion.getShuffleAns().map((e) => AnswerButton(
                  answerText: e,
                  onTap: () {
                    onAnswerTap(e);
                  },
                ))
            // AnswerButton(answerText: curerntQuestion.answers, onTap: () {})
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
