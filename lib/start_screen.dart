import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({required this.toQuiz, super.key});

  final void Function() toQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Opacity(
          //   opacity: 0.75,
          //   child: Image.asset(
          //     'assets/images/quiz-logo.png',
          //     width: 300,
          //   ),
          // ),
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            color: const Color.fromARGB(255, 200, 200, 200),
          ),
          const SizedBox(height: 40),
          const Text(
            'Hello World!, this is Flutter.',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
          const SizedBox(height: 40),
          OutlinedButton.icon(
            onPressed: toQuiz,
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
              side: const BorderSide(color: Colors.white, width: 2),
              elevation: 2.5,
              // shape: const OutlinedBorder(side: BorderSide.none)
              // shape: OutlinedBorder.,
            ),
            icon: const Icon(Icons.star),
            label: const Text("Start Quiz"),
          )
        ],
      ),
    );
  }
}
