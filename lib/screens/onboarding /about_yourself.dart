import 'package:cloture/gen/assets.gen.dart';
import 'package:cloture/utilities/bottom_nav_screen.dart';
import 'package:cloture/utilities/buttons.dart';
import 'package:cloture/utilities/colors.dart';
import 'package:cloture/utilities/text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AboutYourself extends StatefulWidget {
  const AboutYourself({super.key});

  @override
  State<AboutYourself> createState() => _AboutYourselfState();
}

class _AboutYourselfState extends State<AboutYourself> {
  // Track which option is selected ('men' or 'women')
  String selectedOption = '';

  // Track the selected age range
  String? selectedAgeRange;

  // List of age ranges
  final List<String> ageRanges = [
    '18-24',
    '25-34',
    '35-44',
    '45-54',
    '55-64',
    '65+'
  ];
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  // Method to save age and gender to Firestore
  Future<void> saveUserDetails() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      await firestore.collection('users').doc(user.uid).set({
        'age': selectedAgeRange,
        'gender': selectedOption,
      }, SetOptions(merge: true));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white100,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 161.h,
            ),
            reusableText(
              'Tell us About yourself',
              24.sp,
              FontWeight.bold,
              black100,
              -0.41,
              TextAlign.left,
            ),
            SizedBox(height: 49.h),
            reusableText(
              'Who do you shop for?',
              16.sp,
              FontWeight.w500,
              black100,
              -0.41,
              TextAlign.left,
            ),
            SizedBox(
              height: 22.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Men button
                appButton(
                  'Men',
                  selectedOption == 'men'
                      ? primary200
                      : bgLight2, // Background color
                  selectedOption == 'men' ? white100 : black100, // Text color
                  52.h,
                  150.w,
                  100.r,
                  16.sp,
                  FontWeight.w500,
                  Colors.transparent,
                  0,
                  () {
                    setState(() {
                      selectedOption = 'men';
                    });
                  },
                ),
                // Women button
                appButton(
                  'Women',
                  selectedOption == 'women'
                      ? primary200
                      : bgLight2, // Background color
                  selectedOption == 'women' ? white100 : black100, // Text color
                  52.h,
                  150.w,
                  100.r,
                  16.sp,
                  FontWeight.w500,
                  Colors.transparent,
                  0,
                  () {
                    setState(() {
                      selectedOption = 'women';
                    });
                  },
                ),
              ],
            ),
            SizedBox(
              height: 56.h,
            ),
            reusableText(
              'How old are you?',
              16.sp,
              FontWeight.w500,
              black100,
              -0.41,
              TextAlign.left,
            ),
            SizedBox(
              height: 13.h,
            ),
            Container(
              height: 56.h,
              width: 342.w,
              decoration: BoxDecoration(
                color: bgLight2,
                borderRadius: BorderRadius.circular(100.r),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: selectedAgeRange,
                    hint: reusableText(
                      'Age Range',
                      16.sp,
                      FontWeight.w500,
                      black100,
                      -0.41,
                      TextAlign.left,
                    ),
                    isExpanded: true,
                    icon: Assets.images.arrowDown.image(
                      color: black100,
                      height: 16.h,
                      width: 16.w,
                    ),
                    items: ageRanges.map((String ageRange) {
                      return DropdownMenuItem<String>(
                        value: ageRange,
                        child: reusableText(
                          ageRange,
                          16.sp,
                          FontWeight.w500,
                          black100,
                          -0.41,
                          TextAlign.left,
                        ),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedAgeRange = newValue;
                      });
                    },
                    dropdownColor: white100, // Optional: Set dropdown color
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: black100,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 246.h,
            ),
            appButton(
              'Finish',
              primary200,
              white100,
              47.h,
              344.w,
              100.r,
              16.sp,
              FontWeight.w500,
              Colors.transparent,
              -0.5,
              () async {
                await saveUserDetails(); // Save data to Firestore
                // ignore: use_build_context_synchronously
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const BottomNavScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
