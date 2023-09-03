// ignore_for_file: avoid_unnecessary_containers

import 'package:cpsu_midterm_1_2023_starter/screens/home/answer_choice.dart';
import 'package:flutter/material.dart';

// TODO: ใส่รหัสนักศึกษาที่ค่าสตริงนี้
const studentId = '640710052';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static int count = 0;
  static const List<String> _qust = [
    'What is the capital of France?',
    'Which planet is known as the "Red Planet"?',
    'Who wrote the play "Romeo and Juliet"?',
    'What is the largest mammal in the world?'];
  static const List<String> _choice_check = ['D','B','B','B'];
  static const List<String> _answer_a = ['Berlin','Earth','Charles Dickens','African Elephant'];
  static const List<String> _answer_b = ['London','Mars','William Shakespeare','Blue Whale'];
  static const List<String> _answer_c = ['Madrid','Venus','Mark Twain','Glraffe'];
  static const List<String> _answer_d = ['Paris','Jupiter','Jane Austen','Hippopotamus'];

  void goNext() {
    count++;
    if(count == _qust.length){
      count = 0;
    }
    setState(() {});
  }

  void goBack() {
    count--;
    if(count < 0){
      count = (_qust.length)-1;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 20.0,
          ),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/bg_colorful.jpg"),
              opacity: 0.6,
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('Good Morning',
                  textAlign: TextAlign.center, style: textTheme.headlineMedium),
              Text(studentId,
                  textAlign: TextAlign.center,
                  style: textTheme.headlineSmall!.copyWith(
                      fontWeight: FontWeight.bold, color: Colors.black87)),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 16.0,
                  ),
                  Expanded(
                    child: _buildQuizView(),
                  ),
                  SizedBox(
                    width: 16.0,
                  ),
                ],
              ),
              Spacer(),
              _buildButtonPanel(),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  _buildQuizView() {
    // TODO: build UI
    return Container(
      width: 400,
      height: 400,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(width: 2),
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Question ${count+1} of ${_qust.length}'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 16.0,
              ),
              Expanded(
                child: Container(
                  width: 270,
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(width: 2),
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.green,
                  ),
                  child: Center(
                      child: Text(
                    _qust[count],
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  )),
                ),
              ),
              SizedBox(
                width: 16.0,
              ),
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: 20.0,
              ),
              Expanded(
                  child: Answer(
                choice_check: _choice_check[count],
                choice: 'A',
                answer: _answer_a[count],
              )),
              SizedBox(
                width: 20.0,
              ),
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: 20.0,
              ),
              Expanded(
                  child: Answer(
                choice_check: _choice_check[count],
                choice: 'B',
                answer: _answer_b[count],
              )),
              SizedBox(
                width: 20.0,
              ),
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: 20.0,
              ),
              Expanded(
                  child: Answer(
                choice_check: _choice_check[count],
                choice: 'C',
                answer: _answer_c[count],
              )),
              SizedBox(
                width: 20.0,
              ),
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: 20.0,
              ),
              Expanded(
                  child: Answer(
                choice_check: _choice_check[count],
                choice: 'D',
                answer: _answer_d[count],
              )),
              SizedBox(
                width: 20.0,
              ),
            ],
          ),
        ],
      ),
    );
  }

  _buildButtonPanel() {
    // TODO: build UI
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 16.0,
        ),
        Expanded(
          child: ElevatedButton(
            onPressed: () {goBack();},
            child: Text('<',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.black)),
            style: ElevatedButton.styleFrom(
              primary: Colors.red,
              side: BorderSide(width: 2),
              fixedSize: Size(10, 40),
            ),
          ),
        ),
        SizedBox(
          width: 20.0,
        ),
        Expanded(
          child: ElevatedButton(
            onPressed: () {goNext();},
            child: Text('>',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.black)),
            style: ElevatedButton.styleFrom(
              primary: Colors.green,
              side: BorderSide(width: 2),
              fixedSize: Size(10, 40),
            ),
          ),
        ),
        SizedBox(
          width: 20.0,
        ),
      ],
    );
  }
}
