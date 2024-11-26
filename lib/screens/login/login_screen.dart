import 'package:flutter/material.dart';
import 'package:whatsapp_clone_flutter/screens/otp/otp_screen.dart';
import 'package:whatsapp_clone_flutter/widgets/ui_helper.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController phoneController = TextEditingController();
  String selectedCountry = "Pakistan";
  List<String> countries = [
    "Pakistan",
    "America",
    "England",
    "Australia",
    "Finland",
    "Germany"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 80),
          Center(
            child: UiHelper.customText(
              text: "Enter your phone number",
              height: 20,
              color: const Color(0XFF00A884),
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 30),
          UiHelper.customText(
            text: "WhatsApp will verify your phone number",
            height: 16,
          ),
          UiHelper.customText(
            text: "number. Carrier charges may apply.",
            height: 16,
          ),
          UiHelper.customText(
            text: "What's your number?",
            height: 16,
            color: const Color(0XFF00A884),
          ),
          const SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.only(left: 60, right: 60),
            child: DropdownButtonFormField(
              items: countries.map((String country) {
                return DropdownMenuItem(
                  value: country,
                  child: Text(country),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  selectedCountry = newValue!;
                });
              },
              value: selectedCountry,
              decoration: const InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0XFF00A884),
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0XFF00A884),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                width: 40,
                child: Padding(
                  padding: EdgeInsets.only(top: 5.0),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: "+91",
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0XFF00A884),
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0XFF00A884),
                        ),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0XFF00A884),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              SizedBox(
                width: 250,
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: phoneController,
                  decoration: const InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0XFF00A884),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: UiHelper.customButton(
        callback: () {
          login(phoneController.text.toString());
        },
        buttonName: "Next",
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  login(String phoneNumber) {
    if (phoneNumber == '') {
      return ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Enter phone number"),
        backgroundColor: Color(0XFF00A884),
      ));
    } else {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => OTPScreen(phoneNumber: phoneNumber)));
    }
  }
}
