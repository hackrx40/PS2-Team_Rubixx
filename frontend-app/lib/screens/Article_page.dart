import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ArticlePage extends StatefulWidget {
  final String title;
  final String body;
  const ArticlePage({super.key, required this.title, required this.body});

  @override
  State<ArticlePage> createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(
              widget.body,
              style: GoogleFonts.dmSans(fontSize: 17),
            ),
          ],
        ),
      )),
    );
  }
}
