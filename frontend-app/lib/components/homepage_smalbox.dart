import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SmallBoxImage extends StatefulWidget {
  String imageLink;
  String title1;
  SmallBoxImage({
    Key? key,
    required this.imageLink,
    required this.title1,
  }) : super(key: key);

  @override
  State<SmallBoxImage> createState() => _SmallBoxImageState();
}

class _SmallBoxImageState extends State<SmallBoxImage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        width: 80,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Container(
                height: 75.0,
                width: 80,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(widget.imageLink),
                  ),
                  color: Color(0xffAAE7E7),
                  border: Border.all(width: 1.2, color: Color(0xff38D0BF)),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              widget.title1,
              textAlign: TextAlign.center,
              style: GoogleFonts.dmSans(fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
