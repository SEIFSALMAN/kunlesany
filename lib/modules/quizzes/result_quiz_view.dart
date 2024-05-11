import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kunlesany/modules/quizzes/letters_quiz_view.dart';
import '../../models/questions.dart';
import '../../shared/components/navigator.dart';

class QuizResultView extends StatelessWidget {
  const QuizResultView(
      {super.key,
      required this.score,
      required this.totalQuestions});

  final int score;
  final int totalQuestions;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Results"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(AppLocalizations.of(context)!.totalCorrectAnswers),
            Text("$score ${AppLocalizations.of(context)!.outOf} $totalQuestions ${AppLocalizations.of(context)!.questions}."),
            SizedBox(height: 40),
            Text(
              "${AppLocalizations.of(context)!.yourScore}",
              style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 20),

            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  height: 250,
                  width: 250,
                  child: CircularProgressIndicator(
                    strokeWidth: 10,
                    value: score/10,
                    color: Colors.green,
                    backgroundColor: Theme.of(context).dialogBackgroundColor,
                  ),
                ),
                Column(
                  children: [
                    Text(
                      score.toString(),
                      style: const TextStyle(fontSize: 80),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '${(score / questionLetters.length * 100).round()}%',
                      style: const TextStyle(fontSize: 25),
                    )
                  ],
                ),
              ],
            ),
            SizedBox(height: 40),


            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
              child: MaterialButton(
                elevation: 0,
                minWidth: double.maxFinite,
                height: 50,
                onPressed: () async {
                  Navigator.pop(context);
                    AppNavigator.customNavigator(context: context, screen: QuizLettersView(), finish: false);
                },
                color: Colors.green[800],
                textColor: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.restart_alt_sharp),
                    SizedBox(width: 10),
                    Text(AppLocalizations.of(context)!.restart,
                        style: TextStyle(color: Colors.white, fontSize: 24)),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0,vertical: 20),
              child: MaterialButton(
                elevation: 0,
                minWidth: double.maxFinite,
                height: 50,
                onPressed: () async {
                  Navigator.pop(context);
                },
                color: Colors.blue[400],
                textColor: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.arrow_back_sharp),
                    SizedBox(width: 10),
                    Text(AppLocalizations.of(context)!.leave,
                        style: TextStyle(color: Colors.white, fontSize: 24)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
