// ignore: file_names
import 'package:cloture/gen/assets.gen.dart';
import 'package:cloture/screens/home/men/home_page_men.dart';
import 'package:cloture/screens/home/women/home_page_women.dart'; // Make sure to import your HomePageWomen
import 'package:cloture/services/bloc/save%20details/gender_bloc.dart';
import 'package:cloture/utilities/colors.dart';
import 'package:cloture/utilities/text.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Add Firestore import
import 'package:firebase_auth/firebase_auth.dart'; // Add FirebaseAuth import
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? selectedGender;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final User? currentUser = FirebaseAuth.instance.currentUser;

  // List of genders
  final List<String> genders = [
    'Men',
    'Women',
  ];

  @override
  void initState() {
    super.initState();
    _getUserGender(); // Fetch gender on initialization
  }

  // Fetch gender from Firestore
  Future<void> _getUserGender() async {
    if (currentUser != null) {
      DocumentSnapshot userDoc =
          await firestore.collection('users').doc(currentUser!.uid).get();
      String gender = userDoc['gender'];

      setState(() {
        // Convert gender from Firestore to fit Dropdown values
        selectedGender = gender == 'men' ? 'Men' : 'Women';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GenderCubit(),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: white100,
          elevation: 0.0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Assets.images.profilePic.image(height: 42, width: 42),
              Container(
                height: 40.h,
                width: 100.w,
                decoration: BoxDecoration(
                  color: bgLight2,
                  borderRadius: BorderRadius.circular(100.r),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: BlocBuilder<GenderCubit, GenderState>(
                      builder: (context, state) {
                    return DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: selectedGender,
                        hint: reusableText(
                          'Gender',
                          12.sp,
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
                        items: genders.map((String gender) {
                          return DropdownMenuItem<String>(
                            value: gender,
                            child: reusableText(
                              gender,
                              14.sp,
                              FontWeight.w500,
                              black100,
                              -0.41,
                              TextAlign.left,
                            ),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedGender = newValue;
                          });
                          context
                              .read<GenderCubit>()
                              .selectGender(newValue!); // Notify BLoC of change
                        },
                        dropdownColor: white100, // Optional: Set dropdown color
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: black100,
                        ),
                      ),
                    );
                  }),
                ),
              ),
              Container(
                height: 40.h,
                width: 40.w,
                padding: EdgeInsets.all(12.w),
                decoration: BoxDecoration(
                  color: primary200,
                  borderRadius: BorderRadius.circular(100.r),
                ),
                child: Assets.images.shoppingBag.image(height: 16.h),
              )
            ],
          ),
        ),
        backgroundColor: white100,
        body: Column(
          children: [
            // Display appropriate homepage based on gender
            Expanded(
              child: selectedGender == 'Men'
                  ? const HomePageMen()
                  : const HomePageWomen(), // Use HomePageWomen for female selection
            ),
          ],
        ),
      ),
    );
  }
}
