import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SosBox extends StatefulWidget {
  String imageLink;
  String title1;
  SosBox({
    Key? key,
    required this.imageLink,
    required this.title1,
  }) : super(key: key);

  @override
  State<SosBox> createState() => _SosBoxState();
}

class _SosBoxState extends State<SosBox> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: EdgeInsets.all(11),
        height: 145,
        width: 145,
        decoration: BoxDecoration(
          color: Color(0xffF44444),
          border: Border.all(width: 1.2, color: Color(0xff5A5A5A)),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              widget.imageLink,
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Text(
                widget.title1,
                textAlign: TextAlign.center,
                style:
                    GoogleFonts.dmSans(fontSize: 12, color: Color(0xffFFFFFF)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
