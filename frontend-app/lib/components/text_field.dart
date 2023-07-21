import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextFieldComponent extends StatefulWidget {
  String text1;
  TextFieldComponent({
    Key? key,
    required this.text1,
  }) : super(key: key);

  @override
  State<TextFieldComponent> createState() => _TextFieldComponentState();
}

class _TextFieldComponentState extends State<TextFieldComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // width: size.width * 0.9,
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xff38D0BF)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextFormField(
        keyboardType: TextInputType.text,
        // key: ValueKey('password'),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintStyle:
              GoogleFonts.dmSans(fontSize: 14.2, color: Color(0xFF888888)),
          hintText: widget.text1,
          labelStyle: GoogleFonts.roboto(),
        ),
      ),
    );
  }
}
