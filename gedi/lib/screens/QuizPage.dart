import 'package:flutter/material.dart';
import 'package:gedi/models//QuizData.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';

import '../main.dart';

QuizData quizData = QuizData();

class Quiz extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 0.0),
            child: QuizState(),
          ),
        ),
    );
  }
}

class QuizState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Test',
            style: TextStyle(
              fontSize: 40,
            ),
          ),
          backgroundColor: Color(0xffB6B8F1),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Color(0xff6667AB),
                    width: 3,
                  ),
                ),
                child: Center(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Text(
                          '오늘의 문제',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                            child: Center(
                              child: Text(
                                '분자/분모의 올바른 표현은\n무엇일까요?',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          decoration: BoxDecoration(
                            color: Color(0xff6667AB),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xffB6B8F1),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Text(
                              '아랫수/윗수',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Color(0xff6667AB),
                    width: 3,
                  ),
                ),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 5, 0, 0),
                          child: Text(
                            '문제풀기',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: Container(
                              width: 100,
                              child: Divider(
                                  color: Color(0xff6667AB), thickness: 2.0)),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Directionality(
                          textDirection: TextDirection.rtl,
                          child: ElevatedButton.icon(
                            label: Padding(
                              padding: const EdgeInsets.fromLTRB(5, 15, 0, 15),
                              child: Text(
                                'Start',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20),
                              ),
                            ),
                            icon: Icon(
                              Icons.arrow_back,
                              color: Color(0xff6667AB),
                              size: 25,
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => QuizStart()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              side: BorderSide(
                                color: Color(0xff6667AB),
                                width: 2.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Color(0xff6667AB),
                        width: 3,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        '최근 통계',
                        style: TextStyle(fontSize: 50),
                      ),
                    )),
              ),
            )
          ],
        ),
      );
  }
}

class QuizExplanation extends StatelessWidget {
  int num = 0;

  String ExpToOX(int index) {
    if (quizData.getQuizAnswer_n(index)) {
      return '정답: O';
    } else {
      return '정답: X';
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('GeDi'),
          backgroundColor: Color(0xff6667AB),
        ),
        body: ListView.builder(
          itemCount: quizData.gettotalQuiz() + 1,
          padding: EdgeInsets.all(8),
          itemBuilder: (BuildContext context, int index) {
            num = index + 1;
            if (index == quizData.gettotalQuiz()) {
              return Expanded(
                child: Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Center(
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: ElevatedButton.icon(
                        label: Padding(
                          padding: const EdgeInsets.fromLTRB(5, 15, 0, 15),
                          child: Text(
                            'Return',
                            style: TextStyle(color: Colors.black, fontSize: 25),
                          ),
                        ),
                        icon: Icon(
                          Icons.arrow_back,
                          color: Color(0xff6667AB),
                          size: 35,
                        ),
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(builder: (context) => GediApp()),
                              (route) => false);
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            } else {
              return Padding(
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 20, 5, 0),
                        child: Text(
                          'Q$num',
                          style: TextStyle(
                            fontSize: 40,
                            color: Color(0xff6667AB),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 0, 15, 5),
                        child: Text(
                          quizData.getQuizText_n(index),
                          style: TextStyle(fontSize: 25),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: Container(
                            width: 500,
                            child: Divider(
                                color: Color(0xff6667AB), thickness: 2.0)),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 0, 0, 5),
                        child: Text(
                          ExpToOX(index),
                          style: TextStyle(fontSize: 30),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 5, 15, 20),
                        child: Text(
                          quizData.getExp(index),
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      color: Color(0xff6667AB),
                      width: 3,
                    ),
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

class QuizStart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [
            Container(
              color: Color(0xff6667AB),
            ),
            Positioned(
              top: 300,
              height: 10000,
              width: 10000,
              child: Container(color: Color(0xffB6B8F1)),
            ),
            Container(
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Center(
                      child: Text(
                        'GEDI',
                        style: TextStyle(
                          fontSize: 80,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(100, 10, 100, 20),
                    child: Container(
                      height: 350,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Center(
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(10, 80, 20, 10),
                              child: Text(
                                'GeDi 테스트를\n시작합니다!',
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(20, 50, 20, 20),
                              child: Text(
                                '문제를 잘 읽고\n제한시간안에 답안을\n골라주세요.',
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Center(
                        child: Directionality(
                          textDirection: TextDirection.rtl,
                          child: ElevatedButton.icon(
                            label: Padding(
                              padding: const EdgeInsets.fromLTRB(5, 15, 0, 15),
                              child: Text(
                                'Start',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 25),
                              ),
                            ),
                            icon: Icon(
                              Icons.arrow_back,
                              color: Color(0xff6667AB),
                              size: 35,
                            ),
                            onPressed: () {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => QuizPage()),
                                  (route) => false);
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  //Color _ButtonColor = Colors.white;
  Color _ButtonColor = Colors.white;
  List<bool> score = [];
  int ScoreCnt = 0;
  int Quiztotal = quizData.gettotalQuiz();
  int QuizNum = quizData.getQuizNum() + 1;
  CountDownController _controller = CountDownController();

  void CheckAnswer(bool yourAnswer) {
    bool correctAnswer = quizData.getQuizAnswer();
    setState(() {
      if (yourAnswer == correctAnswer) {
        ScoreCnt++;
      }
      if (quizData.QuizFinished() == true) {
        quizData.reset();
        quizData.setResult(ScoreCnt);
        ScoreCnt = 0;
        QuizNum = 1;
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => QuizResult()),
            (route) => false);
      } else {
        QuizNum++;
        quizData.nextQ();
        _controller.restart();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              color: Color(0xffB6B8F1),
              height: 60,
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(15, 0, 5, 0),
                      child: Text(
                        '$QuizNum/$Quiztotal',
                        style: TextStyle(fontSize: 25, color: Colors.black),
                      ),
                    ),
                  ),
                  Container(
                    child: Icon(
                      Icons.access_alarm,
                      color: Color(0xff6667AB),
                      size: 40,
                    ),
                  ),
                  Container(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(5, 0, 10, 0),
                      child: CircularCountDownTimer(
                        duration: 11,
                        initialDuration: 0,
                        controller: _controller,
                        width: 35,
                        height: 35,
                        ringColor: Colors.white70,
                        ringGradient: null,
                        fillColor: Color(0xffA3A4CD),
                        fillGradient: null,
                        backgroundColor: Color(0xff6667AB),
                        backgroundGradient: null,
                        strokeWidth: 3,
                        strokeCap: StrokeCap.round,
                        textStyle: TextStyle(
                            fontSize: 30.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                        textFormat: CountdownTextFormat.S,
                        isReverse: true,
                        isReverseAnimation: false,
                        isTimerTextShown: true,
                        autoStart: true,
                        onStart: () {},
                        onComplete: () {
                          setState(() {
                            if (quizData.QuizFinished() == true) {
                              quizData.reset();
                              quizData.setResult(ScoreCnt);
                              ScoreCnt = 0;
                              QuizNum = 1;
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => QuizResult()),
                                  (route) => false);
                            } else {
                              QuizNum++;
                              quizData.nextQ();
                              _controller.restart();
                            }
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
                child: Text(
                  'Q$QuizNum',
                  style: TextStyle(
                      color: Color(0xff6667AB),
                      fontSize: 40,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ]),
            Expanded(
              flex: 5,
              child: Padding(
                padding: EdgeInsets.fromLTRB(40, 5, 40, 20),
                child: Center(
                  child: Text(
                    quizData.getQuizText(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25.0,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              color: Color(0xffA3A4CD),
              height: 230,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(25.0),
                      child: ElevatedButton(
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              'O',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 100.0,
                              ),
                            ),
                          ),
                        ),
                        onPressed: () {
                          CheckAnswer(true);
                        },
                        style: ElevatedButton.styleFrom(
                          side: BorderSide(
                            color: Color(0xff6667AB),
                            width: 10.0,
                          ),
                          primary: _ButtonColor,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(25.0),
                      child: ElevatedButton(
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              'X',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 100.0,
                              ),
                            ),
                          ),
                        ),
                        onPressed: () {
                          CheckAnswer(false);
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          side: BorderSide(
                            color: Color(0xff6667AB),
                            width: 10.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //TODO: Add a Row here as your score keeper
          ],
        ),
      ),
    );
  }
}

class QuizResult extends StatefulWidget {
  //int Result = quizData.getResult();
  @override
  State<QuizResult> createState() => _QuizResultState();
}

class _QuizResultState extends State<QuizResult> {
  int Result = quizData.Result;
  int total = quizData.gettotalQuiz();
  int Level = quizData.Level;
  String TestComment = quizData.getComment();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              color: Color(0xff6667AB),
            ),
            Positioned(
              top: 200,
              height: 50000,
              width: 50000,
              child: Container(color: Color(0xffB6B8F1)),
            ),
            Positioned(
              top: 125,
              height: 250,
              width: 1000,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
              ),
            ),
            Positioned(
              top: 132.5,
              height: 235,
              width: 1000,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xffB6B8F1),
                ),
              ),
            ),
            Positioned(
              top: 250,
              height: 118,
              width: 235,
              child: Container(
                decoration: const BoxDecoration(
                  color: Color(0xff6667AB),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(120),
                    bottomRight: Radius.circular(120),
                  ),
                ),
              ),
            ),
            Container(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 200, 0, 10),
                    child: Container(
                      color: Colors.white,
                      height: 100,
                      child: Column(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(5, 0, 5, 5),
                              child: Center(
                                child: Text(
                                  '$Result/$total',
                                  style: TextStyle(
                                    fontSize: 30,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              '$TestComment',
                              style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(70, 120, 70, 20),
                    child: Container(
                      height: 150,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                            child: Center(
                              child: Text(
                                'GeDi 테스트로\n성평등 레벨을 올려보세요!\n',
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          Center(
                            child: Text(
                              'Level $Level',
                              style: TextStyle(
                                fontSize: 35,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Center(
                        child: Directionality(
                          textDirection: TextDirection.rtl,
                          child: ElevatedButton.icon(
                            label: Padding(
                              padding: const EdgeInsets.fromLTRB(5, 15, 0, 15),
                              child: Text(
                                'Answer',
                                style:
                                    TextStyle(color: Colors.black, fontSize: 25),
                              ),
                            ),
                            icon: Icon(
                              Icons.arrow_back,
                              color: Color(0xff6667AB),
                              size: 35,
                            ),
                            onPressed: () {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => QuizExplanation()),
                                  (route) => false);
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
