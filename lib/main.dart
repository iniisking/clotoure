import 'package:cloture/screens/onboarding%20/about_yourself.dart';
import 'package:cloture/services/bloc/splash/splash_bloc.dart';
import 'package:cloture/services/bloc/splash/splash_event.dart';
import 'package:cloture/services/firebase/auth_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp();

  // Ensure screen size for ScreenUtil
  await ScreenUtil.ensureScreenSize();

  // Run the app after everything is initialized
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812), // Set your design size here
      minTextAdapt: true, // Ensure text adapts
      splitScreenMode: true, // Enable split screen support
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            useMaterial3: true,
          ),
          home: BlocProvider(
            create: (context) => SplashBloc(authService: AuthService())
              ..add(SplashStart())
              ..add(CheckAuthenticationEvent()),
            child: const AboutYourself(),
          ), // Initial screen of the app
        );
      },
    );
  }
}
