import 'package:flutter/material.dart';
import 'package:whatsapp_clone_flutter/screens/login/login_screen.dart';
import 'package:whatsapp_clone_flutter/widgets/ui_helper.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/boarding.png"),
            const SizedBox(height: 20),
            UiHelper.customText(
              text: "Welcome to WhatsApp",
              height: 20,
              color: const Color(0XFF000000),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                UiHelper.customText(text: "Read out ", height: 14),
                UiHelper.customText(
                    text: "Privacy Policy. ",
                    height: 14,
                    color: const Color(0XFF0C42CC)),
                UiHelper.customText(
                    text: "Tap ''Agree and continue''", height: 14),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                UiHelper.customText(text: "to accept the ", height: 14),
                UiHelper.customText(
                    text: "Teams of Service.",
                    height: 14,
                    color: const Color(0XFF0C42CC)),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: UiHelper.customButton(
        callback: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const LoginScreen(),
            ),
          );
        },
        buttonName: "Agree and continue",
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
