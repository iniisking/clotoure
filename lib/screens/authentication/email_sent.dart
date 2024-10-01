import 'package:cloture/gen/assets.gen.dart';
import 'package:cloture/screens/authentication/sign_in_screen_email.dart';
import 'package:cloture/utilities/buttons.dart';
import 'package:cloture/utilities/colors.dart';
import 'package:cloture/utilities/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmailSent extends StatelessWidget {
  const EmailSent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white100,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Assets.images.mailSent.image(height: 120),
            SizedBox(height: 24.h),
            reusableText(
              'We Sent you an Email to reset\nyour password',
              24.sp,
              FontWeight.bold,
              black100,
              0.0,
              TextAlign.center,
            ),
            SizedBox(
              height: 24.h,
            ),
            appButton('Return to Sign In', primary200, white100, 52.h, 159.w,
                100.r, 16.sp, FontWeight.w500, Colors.transparent, 0, () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SigninScreenEmail()));
            })
          ],
        ),
      ),
    );
  }
}
