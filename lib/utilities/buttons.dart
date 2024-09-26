import 'package:cloture/gen/assets.gen.dart';
import 'package:cloture/utilities/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget appButton(
  String text,
  Color color,
  Color textColor,
  double height,
  double width,
  double radius,
  double fontSize,
  FontWeight fontWeight,
  Color? borderColor,
  double letterSpacing,
  void Function()? onTap,
) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(radius),
        border: Border.all(
          color: borderColor ?? Colors.transparent,
        ),
      ),
      child: Center(
        child: Text(
          text,
          maxLines: 1,
          style: TextStyle(
            color: textColor,
            fontSize: fontSize,
            fontWeight: fontWeight,
            letterSpacing: letterSpacing,
          ),
        ),
      ),
    ),
  );
}

//these are auth buttons for Apple, Goodge and Facebook,

Widget authButton(
  String text,
  Widget icon,
  void Function()? onTap,
) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 19.w),
      height: 52.h,
      width: 344.w,
      decoration: BoxDecoration(
        color: bgLight2,
        borderRadius: BorderRadius.circular(
          100.r,
        ),
        border: Border.all(
          color: Colors.transparent,
        ),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            icon,
            Text(
              text,
              maxLines: 1,
              style: TextStyle(
                color: black100,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                letterSpacing: -0.5,
              ),
            ),
            Container(),
          ],
        ),
      ),
    ),
  );
}

Widget backButton(
  void Function()? onTap,
) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: 40.h,
      padding: EdgeInsets.all(15.w),
      decoration: const BoxDecoration(color: bgLight2, shape: BoxShape.circle),
      child: Assets.images.backArrow.image(),
    ),
  );
}
