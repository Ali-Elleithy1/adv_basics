import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            color: const Color.fromARGB(150, 255, 255, 255),
          ),
          const SizedBox(height: 80),
          Text(
            "Learn Flutter the fun way!",
            style: GoogleFonts.lato(color: Colors.white, fontSize: 24),
          ),
          const SizedBox(height: 20),
          OutlinedButton.icon(
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
              side: BorderSide(color: Colors.white),
            ),
            onPressed: () {
              startQuiz();
            },
            icon: Icon(Icons.arrow_right_alt),
            label: Text(
              'Start Quiz',
              style: GoogleFonts.lato(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
