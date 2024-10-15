// Method to build the shimmer effect
import 'package:cloture/utilities/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

Widget categoriesShimmerEffect() {
  return ListView.builder(
    scrollDirection: Axis.horizontal,
    itemCount: 5, // Show 5 shimmer placeholders
    itemBuilder: (context, index) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Column(
            children: [
              CircleAvatar(
                backgroundColor: bgLight2,
                radius: 40.r,
              ),
              SizedBox(height: 8.h),
              Container(
                width: 60.w,
                height: 10.h,
                color: Colors.white,
              ),
            ],
          ),
        ),
      );
    },
  );
}

// Method to build the shimmer effect for the product container
Widget buildProductShimmerEffect() {
  return ListView.builder(
    scrollDirection: Axis.horizontal,
    itemCount: 4, // Number of shimmer placeholders
    itemBuilder: (context, index) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Stack(
            children: [
              // Shimmering container (acts as the product card)
              Container(
                height: 300.h,
                width: 220.w,
                decoration: BoxDecoration(
                  color: bgLight2,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Placeholder for the product image
                    Container(
                      height: 220.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8.r),
                          topRight: Radius.circular(8.r),
                        ),
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    // Placeholder for product name
                    Padding(
                      padding: EdgeInsets.only(left: 8.w, right: 8.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 14.h,
                            width: 100.w,
                            color: Colors.white,
                          ),
                          SizedBox(height: 8.h),
                          // Placeholder for product price
                          Container(
                            height: 14.h,
                            width: 50.w,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // Placeholder for love icon
              Positioned(
                top: 9.h,
                right: 12.w,
                child: Container(
                  height: 24.h,
                  width: 24.w,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
