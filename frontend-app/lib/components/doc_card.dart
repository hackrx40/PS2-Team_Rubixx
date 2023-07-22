import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mediserv/components/button_1_in_color.dart';
import 'package:mediserv/components/button_2_outline.dart';

class DocCard extends StatefulWidget {
  String imageLink;
  String title1;
  String starNo;
  String subTitle;
  DocCard({
    Key? key,
    required this.imageLink,
    required this.title1,
    required this.starNo,
    required this.subTitle,
  }) : super(key: key);

  @override
  State<DocCard> createState() => _DocCardState();
}

class _DocCardState extends State<DocCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Container(
            child: Row(
              children: [
                Column(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                          // 'https://www.woolha.com/media/2020/03/eevee.png'
                          widget.imageLink),
                      radius: 35.5,
                    ),
                    Row(
                      children: [
                        Text(
                          widget.starNo,
                          style: TextStyle(fontSize: 15),
                        ),
                        Icon(
                          Icons.star,
                          color: Color(0xffFFD700),
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title1,
                      style: GoogleFonts.dmSans(fontSize: 20),
                    ),
                    Text(
                      widget.subTitle,
                      style: GoogleFonts.dmSans(fontSize: 12),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ButtonInColor(
                            imageLink: "", title1: "Book Appointment"),
                        ButtonOutline(imageLink: "", title1: "View Profile")
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
          Divider(
            height: 30,
            color: Color(0xffA3A3A3),
            thickness: 1,
            indent: 10,
            endIndent: 10,
          ),
        ],
      ),
    );
  }
}
