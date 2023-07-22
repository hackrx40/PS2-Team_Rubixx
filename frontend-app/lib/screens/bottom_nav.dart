import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:mediserv/screens/book_doctor.dart';
import 'package:mediserv/screens/chatbot_screen.dart';
import 'package:mediserv/screens/home_screen.dart';
import 'package:mediserv/screens/payment.dart';

import '../components/AppBarr.dart';

class BottomNavig extends StatefulWidget {
  const BottomNavig({super.key});

  @override
  State<BottomNavig> createState() => _BottomNavigState();
}

class _BottomNavigState extends State<BottomNavig> {
  int selectedTab = 0;
  List<Widget> widgets = [HomeScreeen(), Payment()];
  onTap(int i) {
    setState(() {
      selectedTab = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBarr(
        title: "Hi, John",
        appBar: AppBar(),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: 75,
              child: IndexedStack(
                children: widgets,
                index: selectedTab,
              ),
            ),
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  color: Color(0xFF64CCC5),
                  width: width,
                  height: 60,
                  child: Stack(
                    children: [
                      Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        bottom: 0,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: (width / 2) - 52,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  GestureDetector(
                                    onTap: () {},
                                    child: ImageIcon(
                                      AssetImage(
                                        'assets/dashboard.png',
                                      ),
                                      color: Colors.white,
                                      size: 38,
                                    ),
                                  ),
                                  ImageIcon(
                                    AssetImage(
                                      'assets/payment.png',
                                    ),
                                    color: Colors.white,
                                    size: 38,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: (width / 2) - 52,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  ImageIcon(
                                    AssetImage(
                                      'assets/calculator.png',
                                    ),
                                    color: Colors.white,
                                    size: 38,
                                  ),
                                  ImageIcon(
                                    AssetImage(
                                      'assets/vault.png',
                                    ),
                                    color: Colors.white,
                                    size: 38,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )),
            Positioned(
                bottom: 21,
                left: width / 2 - 52,
                right: width / 2 - 52,
                child: GestureDetector(
                  onTap: () async {
                    await showDialog(
                        context: context,
                        builder: (context) => ChatbotScreen());
                  },
                  child: Container(
                    height: 70,
                    width: 70,
                    child: Center(child: Image.asset('assets/chatbot.png')),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Color(0xFFA4FFF9)),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
