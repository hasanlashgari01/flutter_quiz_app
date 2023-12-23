import 'package:flutter/material.dart';
import 'package:quiz_application/constants/Constants.dart';
import 'package:quiz_application/data/Question.dart';
import 'package:quiz_application/screens/result_screen.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int showQuestionIndex = 0;
  int correctAnswer = 0;
  bool isFinalAnswerSumbuted = false;
  Question? selectedQuestion;

  @override
  Widget build(BuildContext context) {
    selectedQuestion = getQuestionList()[showQuestionIndex];
    String questionImageIndex =
        getQuestionList()[showQuestionIndex].imageNameNumber!;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text(
          'سوال ${showQuestionIndex + 1} از ${getQuestionList().length}',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
            ),
            Image(
              image: AssetImage('images/$questionImageIndex.png'),
              height: 300,
            ),
            SizedBox(height: 30),
            Text(
              selectedQuestion!.questionTitle!,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            SizedBox(height: 20),
            ...List.generate(4, (index) => getOptionsItem(index)),
            if (showQuestionIndex == getQuestionList().length - 1 &&
                isFinalAnswerSumbuted)
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  minimumSize: Size(200.0, 50.0),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ResultScreen(
                        resultAnswer: correctAnswer,
                      ),
                    ),
                  );
                },
                child: Text('مشاهده نتایج کوییز'),
              )
          ],
        ),
      ),
    );
  }

  Widget getOptionsItem(int index) {
    return ListTile(
      title: Text(
        getQuestionList()[showQuestionIndex].answerList![index],
        textAlign: TextAlign.end,
      ),
      onTap: () {
        if (selectedQuestion!.correctAnswer == index) {
          setState(() {
            correctAnswer++;
          });
        }

        if (showQuestionIndex < getQuestionList().length - 1) {
          setState(() => showQuestionIndex++);
          return;
        }

        if (showQuestionIndex == getQuestionList().length - 1) {
          setState(() {
            isFinalAnswerSumbuted = true;
          });
        }

      },
    );
  }
}
