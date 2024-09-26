import 'package:cloture/screens/authentication/create_account_screen.dart';
import 'package:cloture/screens/authentication/signin_screen_password.dart';
import 'package:cloture/utilities/buttons.dart';
import 'package:cloture/utilities/colors.dart';
import 'package:cloture/utilities/text.dart';
import 'package:cloture/utilities/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cloture/gen/assets.gen.dart';

class SigninScreenEmail extends StatefulWidget {
  const SigninScreenEmail({super.key});

  @override
  State<SigninScreenEmail> createState() => _SigninScreenEmailState();
}

class _SigninScreenEmailState extends State<SigninScreenEmail> {
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white50,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 27, vertical: 123),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            reusableText(
              'Sign in',
              32.sp,
              FontWeight.bold,
              black100,
              -0.41,
              TextAlign.left,
            ),
            SizedBox(height: 32.h),
            authTextField(
              hintText: 'Email Address',
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(
              height: 16.h,
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
                    builder: (context) => const SigninScreenPassword(),
                  ),
                );
              },
            ),
            SizedBox(
              height: 16.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                reusableText(
                  'Don\'t have an account?',
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
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const CreateAccountScreen(),
                      ),
                    );
                  },
                  child: reusableText(
                    'Create One',
                    12.sp,
                    FontWeight.bold,
                    primary200,
                    -0.5,
                    TextAlign.left,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 71.h,
            ),
            authButton(
              'Continue with Apple',
              Assets.images.appleSvg.image(height: 24.h),
              () {},
            ),
            SizedBox(
              height: 12.h,
            ),
            authButton(
              'Continue with Google',
              Assets.images.googlePng0.image(height: 24.h),
              () {},
            ),
            SizedBox(
              height: 12.h,
            ),
            authButton(
              'Continue with Facebook',
              Assets.images.facebookPng0.image(height: 24.h),
              () {},
            ),
            SizedBox(
              height: 71.h,
            ),
          ],
        ),
      ),
    );
  }
}
