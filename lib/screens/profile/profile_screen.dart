import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:whatsapp_clone_flutter/screens/home/home_screen.dart';
import 'package:whatsapp_clone_flutter/widgets/ui_helper.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController nameController = TextEditingController();
  File? pickedImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 80),
            UiHelper.customText(
              text: "Profile info",
              height: 20,
              color: const Color(0XFF00A884),
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(height: 30),
            UiHelper.customText(
              text: "Please provide your name and an optional",
              height: 14,
            ),
            UiHelper.customText(
              text: "profile photo",
              height: 14,
            ),
            const SizedBox(height: 30),
            GestureDetector(
              onTap: () => _openBottom(context),
              child: pickedImage == null
                  ? CircleAvatar(
                      radius: 80,
                      backgroundColor: const Color(0XFFD9D9D9),
                      child: Image.asset(
                        "assets/images/photo-camera.png",
                        height: 40,
                        fit: BoxFit.cover,
                      ),
                    )
                  : CircleAvatar(
                      radius: 80,
                      backgroundImage: FileImage(pickedImage!),
                    ),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 300,
                  child: TextField(
                    keyboardType: TextInputType.name,
                    controller: nameController,
                    decoration: const InputDecoration(
                      hintText: "Type your name here",
                      hintStyle: TextStyle(
                        color: Color(0XFF5E5E5E),
                      ),
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
                const SizedBox(width: 10),
                Image.asset("assets/images/happy-face.png"),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: UiHelper.customButton(
        callback: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const HomeScreen()));
        },
        buttonName: "Next",
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  _openBottom(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 200,
          width: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () {
                      _pickImage(ImageSource.camera);
                    },
                    icon: const Icon(Icons.camera_alt,
                        size: 80, color: Colors.grey),
                  ),
                  IconButton(
                    onPressed: () {
                      _pickImage(ImageSource.gallery);
                    },
                    icon: const Icon(Icons.image, size: 80, color: Colors.grey),
                  )
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  _pickImage(ImageSource imageSource) async {
    try {
      final photo = await ImagePicker().pickImage(source: imageSource);
      if (photo == null) return;
      final tempImage = File(photo.path);
      setState(() {
        pickedImage = tempImage;
      });
    } catch (e) {
      return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.toString()),
        backgroundColor: const Color(0XFF00A884),
      ));
    }
  }
}
