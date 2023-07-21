import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Button2Hp extends StatelessWidget {
  const Button2Hp({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        margin: EdgeInsets.only(left: 7, top: 4),
        height: 30,
        width: 120,
        decoration: BoxDecoration(
            color: Color(0xff2BB9A9),
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.all(Radius.circular(4))),
        child: Center(
          child: Text(
            "Read More",
            style: GoogleFonts.dmSans(fontSize: 12, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
