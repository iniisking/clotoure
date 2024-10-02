// ignore_for_file: deprecated_member_use

import 'package:cloture/screens/authentication/create_account_screen.dart';
import 'package:cloture/screens/authentication/sign_in_screen_password.dart';
import 'package:cloture/utilities/buttons.dart';
import 'package:cloture/utilities/colors.dart';
import 'package:cloture/utilities/text.dart';
import 'package:cloture/utilities/textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;

  Future<void> checkEmail() async {
    String email = emailController.text.trim(); // Ensure trimming

    setState(() {
      isLoading = true;
    });

    try {
      // Debugging output
      print('Checking email: $email');

      // Fetch sign-in methods for the email
      List<String> signInMethods =
          await FirebaseAuth.instance.fetchSignInMethodsForEmail(email);

      // Debugging output
      print('Sign-in methods: $signInMethods');

      if (signInMethods.isEmpty) {
        // Email is not registered
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Email is not registered. Please create an account.'),
          ),
        );
      } else {
        // Email exists, proceed to the password screen
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => SigninScreenPassword(
              email: email,
            ),
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: ${e.toString()}')),
      );
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white100,
      body: SingleChildScrollView(
        child: Padding(
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
              Form(
                key: _formKey,
                child: authTextField(
                    hintText: 'Email Address',
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.done,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                          .hasMatch(value)) {
                        return 'Please enter a valid email address';
                      }
                      return null;
                    }),
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
                  if (_formKey.currentState!.validate()) {
                    checkEmail();
                  }
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
      ),
    );
  }
}
