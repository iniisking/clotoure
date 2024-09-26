import 'package:cloture/screens/onboarding%20/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  runApp(const MyApp());
  await ScreenUtil.ensureScreenSize();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: Builder(builder: (context) {
        ScreenUtil.init(
          context,
          designSize: Size(375, 812), // Set your design size
          minTextAdapt: true, // Ensure this is set for minTextAdapt
          splitScreenMode: true,
        );
        return const SplashScreen();
      }),
    );
  }
}
