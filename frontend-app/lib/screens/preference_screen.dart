import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mediserv/data/categories_list.dart';
import 'package:mediserv/utils/colors.dart';

class PreferenceScreen extends StatefulWidget {
  const PreferenceScreen({super.key});

  @override
  State<PreferenceScreen> createState() => _PreferenceScreenState();
}

class _PreferenceScreenState extends State<PreferenceScreen> {
  int totalSelected = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Text(
                  'Select upto 5 health related categories',
                  style: GoogleFonts.dmSans(
                    color: Colors.black,
                    fontSize: 23,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                GridView.builder(
                    itemCount: categoriesList.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, crossAxisSpacing: 15),
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (categoriesList[index].clicked == false) {
                                    if (totalSelected < 5) {
                                      categoriesList[index].clicked = true;
                                      totalSelected++;
                                    } else {
                                      Fluttertoast.showToast(
                                          msg: 'Cannot Select more than 5');
                                    }
                                  } else if (categoriesList[index].clicked ==
                                      true) {
                                    categoriesList[index].clicked = false;
                                    totalSelected--;
                                  }
                                });
                              },
                              child: Stack(
                                children: [
                                  Container(
                                    width: 120,
                                    height: 120,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: CustomColors.appBarColor),
                                  ),
                                  categoriesList[index].clicked
                                      ? Container(
                                          width: 120,
                                          height: 120,
                                          child: Icon(
                                            Icons.check,
                                            size: 100,
                                            color: Colors.white,
                                          ),
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.black54),
                                        )
                                      : Container()
                                ],
                              ),
                            ),
                            Text(
                              categoriesList[index].title,
                              style: GoogleFonts.dmSans(fontSize: 17),
                              textAlign: TextAlign.start,
                            )
                          ],
                        ),
                      );
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
