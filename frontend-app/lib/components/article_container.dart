import 'package:flutter/material.dart';

class ArticleContainer extends StatefulWidget {
  String imageLink;
  String title1;
  ArticleContainer({
    Key? key,
    required this.imageLink,
    required this.title1,
  }) : super(key: key);

  @override
  State<ArticleContainer> createState() => _ArticleContainerState();
}

class _ArticleContainerState extends State<ArticleContainer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Container(
        width: 148,
        child: Column(
          children: [
            Container(
              height: 99,
              width: 148,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(widget.imageLink), fit: BoxFit.fill),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(widget.title1)
          ],
        ),
      ),
    );
  }
}
