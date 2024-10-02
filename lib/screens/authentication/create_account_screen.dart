// ignore_for_file: use_build_context_synchronously

import 'package:cloture/screens/onboarding%20/about_yourself.dart';
import 'package:cloture/services/firebase/auth_service.dart';
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
  final AuthService authService = AuthService();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  bool isLoading = false;
  final _formKey = GlobalKey<FormState>();
  // Variable to toggle password visibility
  bool isPasswordVisible = false;

  // Function to toggle password visibility
  void togglePasswordVisibility() {
    setState(() {
      isPasswordVisible = !isPasswordVisible;
    });
  }

  // Function to sign up the user
  Future<void> signUp() async {
    setState(() {
      isLoading = true;
    });

    String firstName = firstNameController.text.trim();
    String lastName = lastNameController.text.trim();
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    try {
      var user = await authService.registerWithEmail(
        email,
        password,
        firstName,
        lastName,
      );

      if (user != null) {
        // Sign up successful, navigate to AboutYourself screen
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const AboutYourself(),
          ),
        );
      } else {
        // Show an error message
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Sign up failed. Please try again.'),
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white100,
      body: SingleChildScrollView(
        child: Padding(
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
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    authTextField(
                      hintText: 'First Name',
                      controller: firstNameController,
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your first name';
                        } else if (value.length < 2) {
                          return 'First name must be at least 2 characters';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    authTextField(
                        hintText: 'Last Name',
                        controller: lastNameController,
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your last name';
                          } else if (value.length < 2) {
                            return 'Last name must be at least 2 characters';
                          }
                          return null;
                        }),
                    SizedBox(
                      height: 16.h,
                    ),
                    authTextField(
                        hintText: 'Email',
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                              .hasMatch(value)) {
                            return 'Please enter a valid email address';
                          }
                          return null;
                        }),
                    SizedBox(
                      height: 16.h,
                    ),
                    authTextField(
                        suffixIcon: IconButton(
                          icon: Icon(
                            isPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: togglePasswordVisibility,
                        ),
                        hintText: 'Password',
                        controller: passwordController,
                        keyboardType: TextInputType.visiblePassword,
                        textInputAction: TextInputAction.done,
                        obscureText: !isPasswordVisible,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          } else if (value.length < 6) {
                            return 'Password must be at least 6 characters';
                          }
                          return null;
                        }),
                  ],
                ),
              ),
              SizedBox(
                height: 40.h,
              ),
              isLoading
                  ? const Center(
                      child: CircularProgressIndicator(
                      color: primary200,
                    ))
                  : appButton(
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
                          signUp();
                        }
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
      ),
    );
  }
}
