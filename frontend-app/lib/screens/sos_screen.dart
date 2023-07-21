import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mediserv/components/sos_box.dart';

class SosScreen extends StatefulWidget {
  const SosScreen({super.key});

  @override
  State<SosScreen> createState() => _SosScreenState();
}

class _SosScreenState extends State<SosScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffF44444),
        title: Text(
          "Mediserv SOS",
          style: GoogleFonts.dmSans(fontSize: 24, color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 62,
                width: 330,
                decoration: BoxDecoration(
                  color: Color(0xffD9D9D9),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    "Take Deep Breathe 1 .... 2 .... 3... ....",
                    style: GoogleFonts.dmSans(
                        fontSize: 20, color: Color(0xffDE570B)),
                  ),
                ),
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.only(
                    left: 28, right: 28, top: 17.5, bottom: 17.5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SosBox(
                      imageLink: "assets/sos_1.png",
                      title1: "Send friends your loaction",
                    ),
                    SosBox(
                      imageLink: "assets/sos_2.png",
                      title1: "Consult a doctor online",
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 28, right: 28, top: 17.5, bottom: 17.5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SosBox(
                      imageLink: "assets/sos_3.png",
                      title1: "Chat with bot",
                    ),
                    SosBox(
                      imageLink: "assets/sos_4.png",
                      title1: "Talk to a therapist",
                    ),
                  ],
                ),
              ),
            ]),
      ),
    );
  }
}
