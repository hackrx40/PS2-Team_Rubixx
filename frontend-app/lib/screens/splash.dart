import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'dart:math' as math;

import 'package:ripple_wave/ripple_wave.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFAAE7E7),
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                color: Colors.yellow,
                child: Center(
                  child: Text(
                    "HI",
                    style: TextStyle(fontSize: 25),
                  ),
                ),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(bottom: 670),
            child: RippleWave(
              color: Color(0xFF38D0BF),
              repeat: true,
              child: const Icon(
                Icons.emoji_emotions,
                size: 200,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
