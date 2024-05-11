import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:kunlesany/modules/quizzes/result_quiz_view.dart';
import '../../models/questions.dart';
import '../../shared/components/answer_card.dart';
import '../../shared/components/next_button.dart';


class QuizLettersView extends StatefulWidget {
  const QuizLettersView({super.key});

  @override
  State<QuizLettersView> createState() => _QuizLettersViewState();
}

class _QuizLettersViewState extends State<QuizLettersView> {
  int? selectedAnswerIndex;
  int questionIndex = 0;
  int currentQuestion = 1;
  int score = 0;

  void pickAnswer(int value) {
    selectedAnswerIndex = value;
    final question = questionLetters[questionIndex];
    if (selectedAnswerIndex == question.correctOptionIndex) {
      score++;
    }
    setState(() {});
  }

  void goToNextQuestion() {
    if (questionIndex < questionLetters.length - 1) {
      questionIndex++;
      selectedAnswerIndex = null;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    List letters = ["1","2","3","4"];
    final totalQuestions = questionLetters.length;
    var currentQuestion = questionIndex;
    final question = questionLetters[questionIndex];
    bool isLastQuestion = questionIndex == questionLetters.length - 1;
    return Scaffold(
      appBar: AppBar(
        title: Text("${AppLocalizations.of(context)!.quiz} 1 : ${AppLocalizations.of(context)!.letters}",
            style: TextStyle(fontFamily: "PlaypenSans", fontSize: 19)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20.0,15,20,5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("${AppLocalizations.of(context)!.question} ${currentQuestion+=1} ${AppLocalizations.of(context)!.oof} ${totalQuestions}",style: TextStyle(color:Colors.blue[400]),),
            Center(child: Text(AppLocalizations.of(context)!.whatisLetter)),
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(questionLetters[questionIndex].questionText),
                ),
              ),
            ),

            ListView.builder(
              shrinkWrap: true,
              itemCount: question.options.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: selectedAnswerIndex == null
                      ? () => pickAnswer(index)
                      : null,
                  child: AnswerCard(
                    letter: letters[index],
                    currentIndex: index,
                    question: question.options[index],
                    isSelected: selectedAnswerIndex == index,
                    selectedAnswerIndex: selectedAnswerIndex,
                    correctAnswerIndex: question.correctOptionIndex,
                  ),
                );
              },
            ),
            // Next Button
            isLastQuestion
                ? RectangularButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (_) => QuizResultView(
                            totalQuestions: questionLetters.length,
                            score: score,
                          ),
                        ),
                      );
                    },
                    label: AppLocalizations.of(context)!.finish,
                  )
                : RectangularButton(
                    onPressed: goToNextQuestion,
                    label: AppLocalizations.of(context)!.next,
                  ),
          ],
        ),
      ),
    );
  }
}
