import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:mediserv/dataProviders/app_data.dart';
import 'package:mediserv/model/user_model.dart';
import 'package:mediserv/screens/bottom_nav.dart';
import 'package:mediserv/utils/auth_helper.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;

import 'package:ripple_wave/ripple_wave.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

void init(BuildContext context) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var token = prefs.getString('token');
  if (token != null) {
    Provider.of<AppData>(context, listen: false).login_out(true);
    UserModel? userModel = await AuthHelper.getUserDetails();
    Provider.of<AppData>(context, listen: false).setUser(userModel!);
  }

  Navigator.push(
      context, MaterialPageRoute(builder: (context) => BottomNavig()));
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init(context);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFAAE7E7),
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [],
          ),
          Container(
            margin: EdgeInsets.only(bottom: 670),
            child: RippleWave(
              color: Color(0xFF38D0BF),
              repeat: true,
              child: const Icon(
                Icons.emoji_emotions,
                size: 200,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
