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
      initialIndex: 1,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          title: UiHelper.customText(
              text: "WhatsApp", height: 20, color: Colors.white),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Image.asset("assets/images/Search.png"),
            ),
            PopupMenuButton<String>(
              onSelected: (value) {
                // print(value);
              },
              itemBuilder: (context) {
                return [
                  const PopupMenuItem(
                      value: "New group", child: Text("New group")),
                  const PopupMenuItem(
                      value: "New broadcast", child: Text("New broadcast")),
                  const PopupMenuItem(
                      value: "Whatsapp web", child: Text("Whatsapp web")),
                  const PopupMenuItem(
                      value: "Starred message", child: Text("Starred message")),
                  const PopupMenuItem(
                      value: "Settings", child: Text("Settings")),
                ];
              },
            )
          ],
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
        ),
        body: const TabBarView(
          children: [
            CameraScreen(),
            ChatsScreen(),
            StatusScreen(),
            CallsScreen(),
          ],
        ),
      ),
    );
  }
}
