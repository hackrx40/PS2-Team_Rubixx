import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppBarr extends StatelessWidget implements PreferredSizeWidget {
  final Color backgroundColor = Color(0xFF64CCC5);
  final String? title;
  final AppBar appBar;
  // final List<Widget> widgets;
  AppBarr({Key? key, this.title, required this.appBar}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Image(image: AssetImage('assets/profile_pic.png')),
      title: Text(
        title!,
        style: GoogleFonts.dmSans(
            color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),
      ),
      backgroundColor: backgroundColor,
      elevation: 0,
      actions: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: EdgeInsets.all(6),
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
                    ),
                    SizedBox(
                      width: 20,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ],
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(appBar.preferredSize.height);
}
