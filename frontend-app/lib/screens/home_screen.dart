import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mediserv/components/AppBarr.dart';
import 'package:mediserv/components/article_container.dart';
import 'package:mediserv/components/bottom_home_page.dart';
import 'package:mediserv/components/heading_subheading.dart';
import 'package:mediserv/components/homepage_smalbox.dart';
import 'package:mediserv/components/search_bar.dart';
import 'package:mediserv/main.dart';
import 'package:mediserv/model/snall_box.dart';
import 'package:mediserv/screens/book_doctor.dart';
import 'package:mediserv/screens/chatbot_screen.dart';
import 'package:mediserv/utils/notif_content.dart';
import 'package:mediserv/utils/notification_controller.dart';
import 'package:mediserv/utils/usage_stats.dart';
import 'package:usage_stats/usage_stats.dart';

class HomeScreeen extends StatefulWidget {
  const HomeScreeen({super.key});

  @override
  State<HomeScreeen> createState() => _HomeScreeenState();
}

class _HomeScreeenState extends State<HomeScreeen> {
  var jsonResult;
  bool defaultLayout = true;
  loadData() {
    DefaultAssetBundle.of(context)
        .loadString("assets/patient_1.json")
        .then((value) {
      jsonResult = jsonDecode(value);
      print(jsonResult);
      analyzeData(jsonResult);
      setState(() {});
    });
    //l
  }

  analyzeData(var jsResult) {
    var ailments = jsResult['ailments'];
    var list = [];
    var doc = {};
    for (var i = 0; i < ailments.length; i++) {
      doc = ailments[i];
      bool lab = false;
      DateTime dt = DateTime.parse(doc['date']);
      if (doc['lab_test'][0] == null) {
        lab = false;
      }
      var map = {"date": dt, "lab": lab};
      list.add(map);
    }
    DateTime dt;
    list.sort((a, b) => a['date'].compareTo(b['date']));

    var filteredObjects = list.where((obj) => !obj['lab']).toList();
    Duration calculateTimeDifference(DateTime date1, DateTime date2) {
      return date1.difference(date2);
    }

    // Find the element with the nearest date
    var nearestObject;
    Duration nearestDifference = Duration(days: 9999);
    // Sort the filtered list of MyObject instances based on the dateTimeValue
    filteredObjects.sort((a, b) => a['date'].compareTo(b['date']));
    for (var obj in filteredObjects) {
      var difference =
          calculateTimeDifference(obj['date'], DateTime.parse(doc['date']));
      if (difference < nearestDifference) {
        nearestObject = obj;
        nearestDifference = difference;
      }
    }
    if (nearestDifference >= Duration(days: 10)) {
      setState(() {
        defaultLayout = false;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // UsageStatistics.getUsage();
    NotificationController.initializeContext(context);
    NotificationController.startListeningNotificationEvents();
    NotificationController.requestFirebaseToken();
  }

  @override
  Widget build(BuildContext context) {
    List<SmallBox> widgets = [
      SmallBox(
          title: "Consult a doctor",
          image: "assets/hp_doc.png",
          pressed: () async {
            // await Navigator.push(
            //     context, MaterialPageRoute(builder: (context) => BookDoctor()));
          }),
      SmallBox(
          title: "Find a Hospital",
          image: "assets/hp_hospital_building.png",
          pressed: () {}),
      SmallBox(
          title: "Lab Tests",
          image: "assets/hp_chemical_analysis.png",
          pressed: () {}),
      SmallBox(
          title: "Buy a plan", image: "assets/hp_task.png", pressed: () {}),
    ];

    List<SmallBox> widgets1 = [
      SmallBox(
          title: "Lab Tests",
          image: "assets/hp_chemical_analysis.png",
          pressed: () {}),
      SmallBox(
          title: "Find a Hospital",
          image: "assets/hp_hospital_building.png",
          pressed: () {}),
      SmallBox(
          title: "Consult a doctor",
          image: "assets/hp_doc.png",
          pressed: () {}),
      SmallBox(
          title: "Buy a plan", image: "assets/hp_task.png", pressed: () {}),
    ];

    loadData();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var body = await NotifContent.getNotification(10);
          var data = jsonDecode(body);
          print(data);
          await NotificationController.createNewCustNotification(
              data['headline'], data['article']);
          // NotificationController.createNewNotification();
          // await UsageStatistics.getUsage();
          //await UsageStatistics.getMostActiveHours();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SearchBarr(
                  searchText: "search for doctors,hospitals, symptoms.."),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 0),
                child: Container(
                  height: 150,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: widgets.length,
                      itemBuilder: (context, index) {
                        double screenWidth = MediaQuery.of(context).size.width;
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => BookDoctor()));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Baseline(
                              baselineType: TextBaseline.alphabetic,
                              baseline: 90,
                              child: Center(
                                child: Container(
                                  width: 80,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Center(
                                        child: Container(
                                          height: 75.0,
                                          width: 80,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage(defaultLayout
                                                  ? widgets[index].image
                                                  : widgets1[index].image),
                                            ),
                                            color: Color(0xffAAE7E7),
                                            border: Border.all(
                                                width: 1.2,
                                                color: Color(0xff38D0BF)),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        defaultLayout
                                            ? widgets[index].title
                                            : widgets1[index].title,
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.dmSans(fontSize: 12),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                ),
                // child: Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   crossAxisAlignment: CrossAxisAlignment.baseline,
                //   textBaseline: TextBaseline.alphabetic,
                //   children: [
                //     SmallBoxImage(
                //       imageLink: "assets/hp_doc.png",
                //       title1: "Consult a doctor",
                //     ),
                //     SmallBoxImage(
                //       imageLink: "assets/hp_hospital_building.png",
                //       title1: "Find a Hospital",
                //     ),
                //     SmallBoxImage(
                //       imageLink: "assets/hp_chemical_analysis.png",
                //       title1: "Lab Tests",
                //     ),
                //     SmallBoxImage(
                //       imageLink: "assets/hp_task.png",
                //       title1: "Buy a plan",
                //     ),
                //   ],
                // ),
              ),
              SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Column(
                  children: [
                    HeadingSubHead(
                      text1: "Curated Article",
                      text2: "Articles based on your interests",
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.only(left: 15),
                height: 165,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return ArticleContainer(
                      imageLink: "assets/hp_veg.png",
                      title1: "Best food to eat as you age",
                    );
                  },
                ),
              ),
              BottomHomePage(),
            ],
          ),
        ),
      ),
    );
  }
}
