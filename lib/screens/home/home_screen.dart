import 'package:flutter/material.dart';
import 'package:whatsapp_clone_flutter/screens/home/calls/calls_screen.dart';
import 'package:whatsapp_clone_flutter/screens/home/camera/camera_screen.dart';
import 'package:whatsapp_clone_flutter/screens/home/chats/chats_screen.dart';
import 'package:whatsapp_clone_flutter/screens/home/status/status_screen.dart';
import 'package:whatsapp_clone_flutter/widgets/ui_helper.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.camera_alt)),
              Tab(text: "CHATS"),
              Tab(text: "STATUS"),
              Tab(text: "CALLS"),
            ],
            indicatorColor: Colors.white,
          ),
          toolbarHeight: 80,
          title: UiHelper.customText(
              text: "WhatsApp", height: 20, color: Colors.white),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Image.asset("assets/images/Search.png")),
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.more_vert_sharp))
          ],
        ),
        body: const TabBarView(children: [
          CameraScreen(),
          ChatsScreen(),
          StatusScreen(),
          CallsScreen(),
        ]),
      ),
    );
  }
}
