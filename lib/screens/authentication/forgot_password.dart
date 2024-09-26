import 'package:cloture/screens/authentication/email_sent.dart';
import 'package:cloture/utilities/buttons.dart';
import 'package:cloture/utilities/colors.dart';
import 'package:cloture/utilities/text.dart';
import 'package:cloture/utilities/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white100,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 23.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 63.h,
            ),
            backButton(() {
              Navigator.of(context).pop();
            }),
            SizedBox(
              height: 20.h,
            ),
            reusableText(
              'Forgot Password',
              32.sp,
              FontWeight.bold,
              black100,
              -0.41,
              TextAlign.left,
            ),
            SizedBox(height: 32.h),
            authTextField(
              hintText: 'Enter Email Address',
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(
              height: 24.h,
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
                    builder: (context) => const EmailSent(),
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
