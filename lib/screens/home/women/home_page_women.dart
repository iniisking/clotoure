import 'package:cloture/gen/assets.gen.dart';
import 'package:cloture/utilities/colors.dart';
import 'package:cloture/utilities/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePageWomen extends StatefulWidget {
  const HomePageWomen({super.key});

  @override
  State<HomePageWomen> createState() => _HomePageWomenState();
}

class _HomePageWomenState extends State<HomePageWomen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white100,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.h),
            child: TextField(
              cursorColor: primary200,
              decoration: InputDecoration(
                hintText: 'Search',
                hintStyle: TextStyle(
                  fontSize: 14.sp,
                  color: black100,
                ),
                prefixIcon: Assets.images.searchnormal1
                    .image(height: 16.h, width: 16.w),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100.r),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: bgLight2,
              ),
            ),
          ),
          SizedBox(
            height: 24.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                reusableText(
                  'Categories',
                  16.sp,
                  FontWeight.bold,
                  black100,
                  -0.41,
                  TextAlign.left,
                ),
                reusableText(
                  'See All',
                  16.sp,
                  FontWeight.w500,
                  primary200,
                  -0.41,
                  TextAlign.left,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 16.h,
          ),
        ],
      ),
    );
  }
}
