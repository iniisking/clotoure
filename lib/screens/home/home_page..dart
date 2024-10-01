// ignore_for_file: file_names

import 'package:cloture/screens/authentication/sign_in_screen_email.dart';
import 'package:cloture/services/firebase/auth_service.dart';
import 'package:cloture/utilities/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Home Page',
              style: TextStyle(
                  fontSize: 25.sp,
                  fontWeight: FontWeight.bold,
                  color: primary200),
            ),
            SizedBox(
              height: 10.h,
            ),
            ElevatedButton(
                onPressed: () {
                  AuthService().signOut();
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SigninScreenEmail()));
                },
                child: Text(
                  'Log out',
                  style: TextStyle(
                      fontSize: 25.sp,
                      fontWeight: FontWeight.bold,
                      color: primary200),
                ))
          ],
        ),
      ),
    );
  }
}
