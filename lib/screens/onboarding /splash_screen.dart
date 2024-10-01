import 'package:cloture/gen/assets.gen.dart';
import 'package:cloture/screens/authentication/sign_in_screen_email.dart';
import 'package:cloture/screens/home/home_page..dart';
import 'package:cloture/services/bloc/splash/splash_bloc.dart';
import 'package:cloture/services/bloc/splash/splash_event.dart';
import 'package:cloture/services/bloc/splash/splash_state.dart';
import 'package:cloture/utilities/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Trigger the splash event
    BlocProvider.of<SplashBloc>(context).add(SplashStart());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary200,
      body: BlocListener<SplashBloc, SplashState>(
        listener: (context, state) {
          // Navigate to home if authenticated
          if (state is Authenticated) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const HomePage(),
              ),
            );
          } else if (state is Unauthenticated) {
            // Navigate to login if unauthenticated
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const SigninScreenEmail(),
              ),
            );
          }
        },
        child: BlocBuilder<SplashBloc, SplashState>(
          builder: (context, state) {
            // Show loading indicator while checking auth
            if (state is SplashStart) {
              return Center(
                child:
                    Assets.images.clotoureLogo.image(height: 270, width: 350),
              );
            }
            return Center(
              child: Assets.images.clotoureLogo.image(height: 270, width: 350),
            ); // Keep this as is; navigation will handle UI
          },
        ),
      ),
    );
  }
}
