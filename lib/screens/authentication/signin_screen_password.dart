import 'package:cloture/screens/authentication/forgot_password.dart';
import 'package:cloture/screens/home/home_page..dart';
import 'package:cloture/services/auth_service.dart';
import 'package:cloture/utilities/buttons.dart';
import 'package:cloture/utilities/colors.dart';
import 'package:cloture/utilities/text.dart';
import 'package:cloture/utilities/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SigninScreenPassword extends StatefulWidget {
  final String email;
  const SigninScreenPassword({
    super.key,
    required this.email,
  });

  @override
  State<SigninScreenPassword> createState() => _SigninScreenPasswordState();
}

class _SigninScreenPasswordState extends State<SigninScreenPassword> {
  TextEditingController passwordController = TextEditingController();
  final AuthService authService = AuthService();
  bool isLoading = false;

  Future<void> signIn() async {
    setState(() {
      isLoading = true;
    });

    String password = passwordController.text;
    var user = await authService.signInWithEmail(widget.email, password);

    setState(() {
      isLoading = false;
    });

    if (user != null) {
      // Sign in successful
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
      );
    } else {
      // Show an error message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Failed to sign in. Please check your credentials.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white50,
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
              authTextField(
                hintText: 'Password',
                controller: passwordController,
                keyboardType: TextInputType.visiblePassword,
                textInputAction: TextInputAction.done,
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
                  signIn();
                },
              ),
              SizedBox(
                height: 16.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  reusableText(
                    'Forgot Password?',
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
                          builder: (context) => const ForgotPassword(),
                        ),
                      );
                    },
                    child: reusableText(
                      'Reset',
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
      ),
    );
  }
}
