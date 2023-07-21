import 'package:flutter/material.dart';
import 'package:mediserv/components/AppBarr.dart';
import 'package:mediserv/components/animated_sos.dart';

import 'package:mediserv/components/doc_card.dart';
import 'package:mediserv/components/heading_subheading.dart';
import 'package:mediserv/components/options_box_book_doc.dart';
import 'package:mediserv/components/overlay_comp.dart';
import 'package:mediserv/components/search_bar.dart';

import '../components/button_1_in_color.dart';
import '../components/button_2_outline.dart';

class BookDoctor extends StatefulWidget {
  const BookDoctor({super.key});

  @override
  State<BookDoctor> createState() => _BookDoctorState();
}

class _BookDoctorState extends State<BookDoctor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: HeadingSubHead(
                text1: "Book an appointment ",
                text2: "Find a doctor for online consultation or book a visit",
              ),
            ),
            SearchBarr(searchText: "search for doctors,hospitals, symptoms..."),
            Container(
              margin: EdgeInsets.only(left: 15),
              height: 50,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  OptionBox(imageLink: "", title1: "Orthopedic"),
                  OptionBox(imageLink: "", title1: "Dentist"),
                  OptionBox(imageLink: "", title1: "Paediatrician"),
                  OptionBox(imageLink: "", title1: "Paediatrician"),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ButtonInColor(imageLink: "", title1: "Online Consultation"),
                ButtonOutline(imageLink: "", title1: "Visit a Doctor"),
              ],
            ),
            DocCard(
              imageLink: "",
              title1: "Dr. K Meheta",
              starNo: "5",
              subTitle: "Dr K Meheta is experienced doctor with 200",
            ),
          ],
        ),
      ),
    );
  }
}
