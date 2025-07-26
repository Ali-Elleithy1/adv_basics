import 'package:adv_basics/data/questions.dart';
import 'package:flutter/material.dart';
import 'package:adv_basics/questions_summary.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.selectedAnswers,
    required this.onRestart,
  });

  final List<String> selectedAnswers;
  final void Function() onRestart;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < selectedAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].questionText,
        'correct_answer': questions[i].answers[0],
        'user_answer': selectedAnswers[i],
        'is_correct': selectedAnswers[i] == questions[i].answers[0],
      });
    }
    return summary;
  }

  @override
  Widget build(context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectAnswers = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;

    return Container(
      margin: const EdgeInsets.all(40),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'You have answered $numCorrectAnswers out of $numTotalQuestions questions correctly!',
            style: GoogleFonts.lato(
              color: const Color.fromARGB(255, 30, 73, 93),
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 30),
          QuestionsSummary(getSummaryData()),
          const SizedBox(height: 30),
          OutlinedButton.icon(
            onPressed: onRestart,
            icon: const Icon(
              Icons.refresh,
              color: Color.fromARGB(255, 196, 236, 255),
            ),
            label: Text(
              'Restart Quiz!',
              style: GoogleFonts.lato(
                color: Color.fromARGB(255, 196, 236, 255),
                fontSize: 16,
              ),
            ),
            style: OutlinedButton.styleFrom(
              side: BorderSide(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
