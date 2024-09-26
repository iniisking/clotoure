import 'package:cloture/screens/onboarding%20/about_yourself.dart';
import 'package:cloture/utilities/buttons.dart';
import 'package:cloture/utilities/colors.dart';
import 'package:cloture/utilities/text.dart';
import 'package:cloture/utilities/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white100,
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 23.w,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 63.h,
            ),
            backButton(() {
              Navigator.of(context).pop();
            }),
            reusableText(
              'Create Account',
              32.sp,
              FontWeight.bold,
              black100,
              -0.41,
              TextAlign.left,
            ),
            SizedBox(height: 32.h),
            authTextField(
              hintText: 'First Name',
              controller: firstNameController,
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(
              height: 16.h,
            ),
            authTextField(
              hintText: 'Last Name',
              controller: lastNameController,
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(
              height: 16.h,
            ),
            authTextField(
              hintText: 'Email',
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(
              height: 16.h,
            ),
            authTextField(
              hintText: 'Password',
              controller: passwordController,
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(
              height: 40.h,
            ),
            appButton(
              'Continue',
              primary200,
              white100,
              47.h,
              344.w,
              100.r,
              16.sp,
              FontWeight.w500,
              Colors.transparent,
              -0.5,
              () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const AboutYourself(),
                  ),
                );
              },
            ),
            SizedBox(
              height: 40.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                reusableText(
                  'Already have an account?',
                  12.sp,
                  FontWeight.w500,
                  black100,
                  -0.5,
                  TextAlign.left,
                ),
                SizedBox(
                  width: 8.w,
                ),
                GestureDetector(
                  onTap: () {},
                  child: reusableText(
                    'Sign In',
                    12.sp,
                    FontWeight.bold,
                    primary200,
                    -0.5,
                    TextAlign.left,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
