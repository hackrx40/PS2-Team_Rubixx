import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mediserv/model/question.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:mediserv/utils/colors.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

List<Question> questions = <Question>[
  Question(
      question: 'Which of the following cannot be polarised?',
      answers: ['Radiowaves', 'Transverse waves', 'Sound waves', 'X-Rays'],
      correctAnswer: 'Radiowaves'),
  Question(
      question: 'Which of the  cannot be polarised?',
      answers: ['Radiowaves', 'Transverse waves', 'Sound waves', 'X-Rays'],
      correctAnswer: 'Radiowaves')
];

class _QuizScreenState extends State<QuizScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    testDuration = Duration(minutes: 15);
    _groupValue = _currentQuestionIndex;
    startTimer();
  }

  int _currentQuestionIndex = 0;
  String? _markedAnswer;
  Question? currentQues;

  Timer? countDownTimer;
  Duration? testDuration;

  String printDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "$twoDigitMinutes:$twoDigitSeconds";
  }

  int? _groupValue;
  void _nextQuestion() {
    if (questions.length > _currentQuestionIndex + 1) {
      setState(() {
        _currentQuestionIndex = _currentQuestionIndex + 1;
      });
    } else {}
  }

  void _prevQuestion() {
    if (_currentQuestionIndex - 1 >= 0) {
      setState(() {
        _currentQuestionIndex = _currentQuestionIndex - 1;
      });
    }
  }

  void markAnswer(String answer) {
    Question currentQues = questions[_currentQuestionIndex];
    if (currentQues.answers.contains(answer)) {
      setState(() {
        currentQues.markedAnswer = answer;
      });
    }
  }

  void onchangedAnswer(val) {
    setState(() {
      _groupValue = val;
    });
    markAnswer(currentQues!.answers[val]);
  }

  void setCountDown() {
    const reduceSecondsBy = 1;
    final seconds = testDuration!.inSeconds - reduceSecondsBy;

    setState(() {
      seconds < 0
          ? countDownTimer!.cancel()
          : testDuration = Duration(seconds: seconds);
      print(testDuration);
    });
  }

  void startTimer() {
    countDownTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      setCountDown();
    });
  }

  void stopTimer() {
    countDownTimer!.cancel();
  }

  void resetTimer(Duration duration) {
    stopTimer();
    setState(() {
      testDuration = duration;
    });
  }

  @override
  Widget build(BuildContext context) {
    currentQues = questions[_currentQuestionIndex];
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Container(
            //   margin: const EdgeInsets.only(top: 13, left: 23),
            //   child: Align(
            //     alignment: Alignment.topLeft,
            //     child: Image.asset('assets/images/logo.png'),
            //   ),
            // ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 25,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 19, vertical: 13),
                    decoration: BoxDecoration(
                        color: CustomColors.appBarColor,
                        borderRadius: BorderRadius.circular(10)),
                    width: 0.915 * width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        SizedBox(
                          width: 150,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Icon(
                                Fontisto.clock,
                                color: Colors.white,
                                size: 20,
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Text(
                                'Time Remaining',
                                style: GoogleFonts.poppins(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        Text(printDuration(testDuration!),
                            style: GoogleFonts.poppins(color: Colors.white))
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 32),
                    child: Text(
                      'Question ${_currentQuestionIndex + 1}',
                      style: GoogleFonts.poppins(color: Color(0xFF707070)),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 9),
                    child: Text(
                      currentQues!.question,
                      textAlign: TextAlign.left,
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: const Color(0xFF202020)),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 32),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: currentQues!.answers.length,
                      itemBuilder: (context, index) {
                        print(_groupValue);
                        return GestureDetector(
                          onTap: () {
                            onchangedAnswer(index);
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(0),
                              color: const Color(0xFFF3F3F3),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Radio(
                                    value: index,
                                    groupValue: _groupValue,
                                    onChanged: onchangedAnswer),
                                Text('${String.fromCharCode(65 + index)})'),
                                SizedBox(
                                  width: 15,
                                ),
                                Text(currentQues!.answers[index])
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          _prevQuestion();
                        },
                        child: Row(children: [
                          Icon(
                            Entypo.chevron_small_left,
                            color: const Color(0xFF7F5EEC),
                            size: 21,
                          ),
                          Text('Previous',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500, fontSize: 18))
                        ]),
                      ),
                      _currentQuestionIndex < questions.length - 1
                          ? TextButton(
                              onPressed: () {
                                print("next");
                                _nextQuestion();
                              },
                              child: Row(children: [
                                Text('Next',
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18)),
                                const Icon(
                                  Entypo.chevron_small_right,
                                  color: Color(0xFF7F5EEC),
                                  size: 21,
                                ),
                              ]),
                            )
                          : SizedBox.shrink()
                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  _currentQuestionIndex == (questions.length - 1)
                      ? MaterialButton(
                          color: CustomColors.appBarColor,
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25)),
                          onPressed: () {},
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Submit',
                                style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 23)),
                          ),
                        )
                      : Container()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
