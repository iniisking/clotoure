import 'package:cloture/utilities/buttons.dart';
import 'package:cloture/utilities/colors.dart';
import 'package:cloture/utilities/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AboutYourself extends StatefulWidget {
  const AboutYourself({super.key});

  @override
  State<AboutYourself> createState() => _AboutYourselfState();
}

class _AboutYourselfState extends State<AboutYourself> {
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
                appButton(
                  'Men',
                  primary200,
                  white100,
                  52.h,
                  150.w,
                  100.r,
                  16.sp,
                  FontWeight.w500,
                  Colors.transparent,
                  0,
                  () {},
                ),
                appButton(
                  'Women',
                  primary200,
                  white100,
                  52.h,
                  150.w,
                  100.r,
                  16.sp,
                  FontWeight.w500,
                  Colors.transparent,
                  0,
                  () {},
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
            // ageDropDown(),
          ],
        ),
      ),
    );
  }
}
