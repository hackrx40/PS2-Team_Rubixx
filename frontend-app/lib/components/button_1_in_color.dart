import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonInColor extends StatefulWidget {
  String imageLink;
  String title1;
  ButtonInColor({
    Key? key,
    required this.imageLink,
    required this.title1,
  }) : super(key: key);

  @override
  State<ButtonInColor> createState() => _ButtonInColorState();
}

class _ButtonInColorState extends State<ButtonInColor> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        margin: EdgeInsets.only(left: 7, top: 4),
        height: 30,
        width: 120,
        decoration: BoxDecoration(
            color: Color(0xff2BB9A9),
            // border: Border.all(color: Color(0xff38D0BF)),
            borderRadius: BorderRadius.all(Radius.circular(4))),
        child: Center(
          child: Text(
            widget.title1,
            style: GoogleFonts.dmSans(fontSize: 12, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
