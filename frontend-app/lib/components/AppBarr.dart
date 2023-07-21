import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mediserv/screens/login_screen.dart';

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
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => LoginScreen()));
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  margin: EdgeInsets.only(right: 10),
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.green.shade100,
                  ),
                  child: Text(
                    'Login/Signup',
                    style: GoogleFonts.dmSans(
                        backgroundColor: Colors.green.shade100,
                        color: Colors.black,
                        fontSize: 16),
                  ))
            ],
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(appBar.preferredSize.height);
}
