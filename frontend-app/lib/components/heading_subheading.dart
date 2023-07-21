import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeadingSubHead extends StatelessWidget {
  String? text1;
  String? text2;
  HeadingSubHead({
    Key? key,
    this.text1,
    this.text2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            text1!,
            style: GoogleFonts.dmSans(color: Color(0xff38D0BF), fontSize: 28),
          ),
          Text(
            text2!,
            style: GoogleFonts.dmSans(color: Colors.black, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
