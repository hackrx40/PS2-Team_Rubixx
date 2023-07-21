import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mediserv/components/button1HomePage.dart';
import 'package:mediserv/components/button2HomePage.dart';

class BottomHomePage extends StatefulWidget {
  const BottomHomePage({super.key});

  @override
  State<BottomHomePage> createState() => _BottomHomePageState();
}

class _BottomHomePageState extends State<BottomHomePage> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      height: 191,
      width: double.infinity,
      color: Color(0xff2BB9A9),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset(
                'assets/hp_creditcard_phone.png',
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Container(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Get your card now",
                      style:
                          GoogleFonts.dmSans(fontSize: 19, color: Colors.white),
                    ),
                    Text(
                      "Avail Multiple benefits",
                      style:
                          GoogleFonts.dmSans(fontSize: 12, color: Colors.white),
                    ),
                    Button1Hp(),
                    Button2Hp(),
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}
