import 'package:cloture/screens/authentication/sign_in_screen_email.dart';
import 'package:cloture/services/firebase/auth_service.dart';
import 'package:cloture/utilities/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white100,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Profile Page',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
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
