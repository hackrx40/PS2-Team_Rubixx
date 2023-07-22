import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OptionBox extends StatefulWidget {
  String? imageLink;
  String title1;
  OptionBox({
    Key? key,
    this.imageLink,
    required this.title1,
  }) : super(key: key);

  @override
  State<OptionBox> createState() => _OptionBoxState();
}

class _OptionBoxState extends State<OptionBox> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xffD9D9D9),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.title1,
                style: GoogleFonts.dmSans(fontSize: 16, color: Colors.black),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
