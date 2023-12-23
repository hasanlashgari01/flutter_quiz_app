import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  ResultScreen({Key? key, this.resultAnswer = 0}) : super(key: key);

  int resultAnswer = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: Text(
          'نتیجه آزمون',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image(image: AssetImage('images/cup.png')),
          ),
          SizedBox(height: 20.0),
          Text(
            'پاسخ های صحیح شما',
            style: TextStyle(
              fontSize: 20,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            '${resultAnswer}',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 100,
              color: Colors.green,
            ),
            textAlign: TextAlign.center,
          )
        ],
      )),
    );
  }
}
