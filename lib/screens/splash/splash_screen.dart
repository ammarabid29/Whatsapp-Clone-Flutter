import 'dart:async';

import 'package:flutter/material.dart';
import 'package:whatsapp_clone_flutter/screens/onBoarding/on_boarding_screen.dart';
import 'package:whatsapp_clone_flutter/widgets/ui_helper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const OnBoardingScreen(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/whatsapp.png"),
            const SizedBox(height: 20),
            UiHelper.customText(
              text: "WhatsApp",
              height: 18,
              fontWeight: FontWeight.bold,
            ),
          ],
        ),
      ),
    );
  }
}
