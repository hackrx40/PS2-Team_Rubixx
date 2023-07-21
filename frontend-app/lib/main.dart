import 'package:flutter/material.dart';
import 'package:mediserv/screens/book_doctor.dart';
import 'package:mediserv/screens/bottom_nav.dart';
import 'package:mediserv/screens/home_screen.dart';
import 'package:mediserv/screens/plan_screen.dart';
import 'package:mediserv/screens/quiz/quiz.dart';

import 'package:mediserv/utils/notification_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationController.initializeLocalNotifications();
  await NotificationController.initializeRemoteNotifications(debug: true);
  await NotificationController.getInitialNotificationAction();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      navigatorKey: MyApp.navigatorKey,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: (routeSettings) {
        print("Route requested: ${routeSettings.name}");
        switch (routeSettings.name) {
          case 'plan':
            return MaterialPageRoute(builder: (context) => PlanScreen());
          default:
            return MaterialPageRoute(builder: (context) => HomeScreeen());
        }
      },
      // home: HomeScreeen(),
      home: QuizScreen(),
      //home: PlanScreen(),
    );
  }
}
