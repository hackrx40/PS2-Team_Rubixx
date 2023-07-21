import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Button1Hp extends StatelessWidget {
  const Button1Hp({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.only(left: 7, top: 4),
        height: 30,
        width: 120,
        decoration: BoxDecoration(
            color: Color(0xff9CD2D2),
            borderRadius: BorderRadius.all(Radius.circular(4))),
        child: Center(
          child: Text(
            "Apply Now ",
            style: GoogleFonts.dmSans(fontSize: 12, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
