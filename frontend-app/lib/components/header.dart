import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

class Header extends StatefulWidget {
  const Header({super.key});

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.all(20),
      height: 76,
      color: Color(0xFF64CCC5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image(image: AssetImage('assets/profile_pic.png')),
              SizedBox(
                width: 15,
              ),
              Text(
                'Hi John Doe',
                style: GoogleFonts.dmSans(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF1E1E1E)),
              )
            ],
          ),
          Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color(0xFFE8E8E8),
            ),
            child: Row(
              children: [
                Image.asset(
                  'assets/coin.png',
                  height: 36,
                  width: 36,
                ),
                Text(
                  '239 points',
                  style: GoogleFonts.dmSans(
                      fontSize: 15, color: Color(0xFF1E1E1E)),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
