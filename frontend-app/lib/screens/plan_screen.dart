import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mediserv/components/AppBarr.dart';
import 'package:mediserv/components/heading_subheading.dart';
import 'package:mediserv/components/rounded_button.dart';
import 'package:mediserv/components/text_field.dart';

class PlanScreen extends StatefulWidget {
  const PlanScreen({super.key});

  @override
  State<PlanScreen> createState() => _PlanScreenState();
}

class _PlanScreenState extends State<PlanScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarr(
        title: "Hi, John",
        appBar: AppBar(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 34),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Find Plans that suits you',
                    style: GoogleFonts.dmSans(
                        color: Color(0xff38D0BF), fontSize: 28),
                  ),
                  RichText(
                      text: TextSpan(
                          text: 'From',
                          style: GoogleFonts.dmSans(
                              color: Colors.black, fontSize: 12),
                          children: [
                        TextSpan(
                            text: ' Bajaj Finserv’s ',
                            style: GoogleFonts.dmSans(
                                color: Color(0xFF202499), fontSize: 12)),
                        TextSpan(
                            text: 'Plans find best that suits you',
                            style: GoogleFonts.dmSans(
                                color: Colors.black, fontSize: 12))
                      ]))
                ],
              ),
            ),
            SizedBox(
              height: 52,
            ),
            TextFieldComponent(text1: "Enter your monthly income"),
            TextFieldComponent(text1: "Enter your age"),
            SizedBox(
              height: 35,
            ),
            Text(
              " Are you married?",
              style: GoogleFonts.dmSans(
                  fontSize: 15, color: Color.fromARGB(255, 63, 62, 62)),
            ),
            // somehting to be added here
            TextFieldComponent(
                text1: "If you have purchased any plan before,mention it"),
            RoundedButton(
              text: 'Find Plans',
              press: () {},
            ),
          ],
        ),
      ),
    );
  }
}
