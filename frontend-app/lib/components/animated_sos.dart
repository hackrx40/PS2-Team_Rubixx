import 'dart:async';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:mediserv/screens/sos_screen.dart';

class SosButtonAnimated extends StatefulWidget {
  const SosButtonAnimated({super.key});

  @override
  State<SosButtonAnimated> createState() => _SosButtonAnimatedState();
}

class _SosButtonAnimatedState extends State<SosButtonAnimated> {
  Timer? _timer;
  int _start = 5;
  void startTimer() {
    const oneSec = const Duration(seconds: 5);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
            Navigator.pop(context);
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => SosScreen()));
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedButton(
        text: "SOS",
        color: Color(0xffF44444),
        pressEvent: () {
          startTimer();
          AwesomeDialog(
                  context: context,
                  dialogType: DialogType.warning,
                  animType: AnimType.topSlide,
                  title: "Warning",
                  dismissOnTouchOutside: false,
                  dismissOnBackKeyPress: false,
                  desc:
                      "Are you sure ? If you click it by mistake close it within ${_start} sec",
                  btnCancelOnPress: () {},
                  transitionAnimationDuration:
                      const Duration(milliseconds: 300),
                  btnOkOnPress: () {})
              .show();
        });
  }
}
