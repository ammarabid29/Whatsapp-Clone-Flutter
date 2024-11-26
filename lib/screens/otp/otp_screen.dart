import 'package:flutter/material.dart';
import 'package:whatsapp_clone_flutter/screens/profile/profile_screen.dart';
import 'package:whatsapp_clone_flutter/widgets/ui_helper.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key, required this.phoneNumber});
  final String phoneNumber;

  @override
  Widget build(BuildContext context) {
    TextEditingController otp1Controller = TextEditingController();
    TextEditingController otp2Controller = TextEditingController();
    TextEditingController otp3Controller = TextEditingController();
    TextEditingController otp4Controller = TextEditingController();
    TextEditingController otp5Controller = TextEditingController();
    TextEditingController otp6Controller = TextEditingController();

    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 80),
          Center(
            child: UiHelper.customText(
              text: "Verifying your number",
              height: 20,
              color: const Color(0XFF00A884),
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 30),
          UiHelper.customText(
            text: "You have tried to register $phoneNumber",
            height: 14,
          ),
          UiHelper.customText(
            text: "recently. Wait before requesting an sms or a call.",
            height: 14,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              UiHelper.customText(text: "with your code. ", height: 14),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: UiHelper.customText(
                  text: "Wrong number?",
                  height: 14,
                  color: const Color(0XFF00A884),
                ),
              )
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              UiHelper.customContainer(otp1Controller),
              const SizedBox(width: 10),
              UiHelper.customContainer(otp2Controller),
              const SizedBox(width: 10),
              UiHelper.customContainer(otp3Controller),
              const SizedBox(width: 10),
              UiHelper.customContainer(otp4Controller),
              const SizedBox(width: 10),
              UiHelper.customContainer(otp5Controller),
              const SizedBox(width: 10),
              UiHelper.customContainer(otp6Controller),
            ],
          ),
          const SizedBox(height: 30),
          UiHelper.customText(
            text: "Didn't receive code?",
            height: 14,
            color: const Color(0XFF00A884),
          ),
        ],
      ),
      floatingActionButton: UiHelper.customButton(
        callback: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const ProfileScreen()));
        },
        buttonName: "Next",
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
