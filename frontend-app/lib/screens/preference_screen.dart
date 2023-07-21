import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PreferenceScreen extends StatefulWidget {
  const PreferenceScreen({super.key});

  @override
  State<PreferenceScreen> createState() => _PreferenceScreenState();
}

class _PreferenceScreenState extends State<PreferenceScreen> {
 List categories= [{"title":"Aarogya Care","clicked":false,"image":""},{"title":"Ayurveda","clicked":false,"image":""},{"title":"Bone Health","clicked":false,"image":""},{"title":"Cancer","clicked":false,"image":""},{"title":"Child Care","clicked":false,"image":""},{"title":"Cholesterol","clicked":false,"image":""},{"title":"Covid","clicked":false,"image":""},{"title":"Diabetes","clicked":false,"image":""},{"title":"Doctor Speak","clicked":false,"image":""},{"title":"ENT","clicked":false,"image":""},{"title":"Eye Health","clicked":false,"image":""},{"title":"General Health","clicked":false,"image":""},{"title":"Health Tests","clicked":false,"image":""},{"title":"Health Heart","clicked":false,"image":""},{"title":"Homeopathy","clicked":false,"image":""},{"title":"Hypertension","clicked":false,"image":""},{"title":"Immunity","clicked":false,"image":""},{"title":"Mental Wellness","clicked":false,"image":""},{"title":"Nutrition","clicked":false,"image":""},{"title":"Oral Care","clicked":false,"image":""},{"title":"Women's Health","clicked":false,"image":""},{"title":"Skin & Hair","clicked":false,"image":""},{"title":"Thyroid","clicked":false,"image":""},{"title":"Yoga & Exercise","clicked":false,"image":""}]

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                'Select upto 5 health related categories',
                style: GoogleFonts.dmSans(
                  fontSize: 23,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 25,
              ),
              GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, crossAxisSpacing: 15),
                  itemBuilder: (context, index) {
                    return Container(
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.blue,
                              ),
                              
                            ],
                          ),
                          Text(healthArticleHeading[index])
                        ],
                      ),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
