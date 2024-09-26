import 'package:cloture/gen/assets.gen.dart';
import 'package:cloture/screens/authentication/signin_screen_email.dart';
import 'package:cloture/utilities/colors.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to SigninScreenEmail after 7 seconds
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const SigninScreenEmail(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary200,
      body: Center(
        child: Assets.images.clotoureLogo.image(height: 270, width: 350),
      ),
    );
  }
}
