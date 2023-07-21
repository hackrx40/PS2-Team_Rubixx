// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mediserv/utils/colors.dart';

class OverLayCompBox extends StatefulWidget {
  String title1;
  String imagLink;
  OverLayCompBox({
    Key? key,
    required this.title1,
    required this.imagLink,
  }) : super(key: key);

  @override
  State<OverLayCompBox> createState() => _OverLayCompBoxState();
}

class _OverLayCompBoxState extends State<OverLayCompBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 3,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [],
      ),
    );
  }
}
