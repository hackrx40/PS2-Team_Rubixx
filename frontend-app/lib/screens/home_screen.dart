import 'package:flutter/material.dart';
import 'package:mediserv/components/AppBarr.dart';
import 'package:mediserv/components/article_container.dart';
import 'package:mediserv/components/bottom_home_page.dart';
import 'package:mediserv/components/heading_subheading.dart';
import 'package:mediserv/components/homepage_smalbox.dart';
import 'package:mediserv/components/search_bar.dart';
import 'package:mediserv/screens/chatbot_screen.dart';
import 'package:mediserv/utils/notification_controller.dart';
import 'package:mediserv/utils/usage_stats.dart';
import 'package:usage_stats/usage_stats.dart';

class HomeScreeen extends StatefulWidget {
  const HomeScreeen({super.key});

  @override
  State<HomeScreeen> createState() => _HomeScreeenState();
}

class _HomeScreeenState extends State<HomeScreeen> {
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
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          NotificationController.createNewNotification();
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    SmallBoxImage(
                      imageLink: "assets/hp_doc.png",
                      title1: "Consult a doctor",
                    ),
                    SmallBoxImage(
                      imageLink: "assets/hp_hospital_building.png",
                      title1: "Find a Hospital",
                    ),
                    SmallBoxImage(
                      imageLink: "assets/hp_chemical_analysis.png",
                      title1: "Lab Tests",
                    ),
                    SmallBoxImage(
                      imageLink: "assets/hp_task.png",
                      title1: "Buy a plan",
                    ),
                  ],
                ),
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
