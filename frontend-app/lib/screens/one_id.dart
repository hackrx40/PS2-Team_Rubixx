import 'package:flutter/material.dart';
import 'package:mediserv/components/AppBarr.dart';
import 'package:mediserv/components/heading_subheading.dart';
import 'package:mediserv/components/search_bar.dart';

class OneId extends StatefulWidget {
  const OneId({super.key});

  @override
  State<OneId> createState() => _OneIdState();
}

class _OneIdState extends State<OneId> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarr(
        title: "Hi, John",
        appBar: AppBar(),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: HeadingSubHead(
              text1: "One ID ",
              text2: "Share your all medical reports with your doctor ",
            ),
          ),
          SearchBarr(searchText: "search for doctors,hospitals, symptoms..."),
          // MED REPORTS IMAG DISPLAY API
        ],
      ),
    );
  }
}
