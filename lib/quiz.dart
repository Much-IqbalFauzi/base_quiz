import 'package:bazequiz/data/question.dart';
import 'package:bazequiz/questions_screen.dart';
import 'package:bazequiz/result_screen.dart';
import 'package:bazequiz/start_screen.dart';
import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  Widget? activeScreen;

  String screenIdentity = 'start-screen';

  List<String> selectedAns = [];

  @override
  void initState() {
    activeScreen = StartScreen(toQuiz: switchScreen);
    super.initState();
  }

  void switchScreen() {
    setState(() {
      screenIdentity = 'question-screen';
      activeScreen = QuestionScreen(onSelectAns: chooseAns);
    });
  }

  void chooseAns(String ans) {
    selectedAns.add(ans);

    if (selectedAns.length == questions.length) {
      setState(() {
        // selectedAns = [];
        screenIdentity = 'result-screen';
      });
    }
  }

  void restartQuestion() {
    setState(() {
      selectedAns = [];
      screenIdentity = 'start-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    // final screenWidget = screenIdentity == 'start-screen'
    //     ? StartScreen(toQuiz: switchScreen)
    //     : const QuestionScreen();

    Widget screenWidget = StartScreen(toQuiz: switchScreen);

    if (screenIdentity == 'question-screen') {
      screenWidget = QuestionScreen(onSelectAns: chooseAns);
    } else if (screenIdentity == 'result-screen') {
      screenWidget = ResultScreen(
        choosenAns: selectedAns,
        restart: restartQuestion,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.cyan, Colors.blueAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          // child: activeScreen,
          // child: screenIdentity == 'start-screen'
          //     ? StartScreen(toQuiz: switchScreen)
          //     : const QuestionScreen(),
          child: screenWidget,
        ),
      ),
    );
  }
}
