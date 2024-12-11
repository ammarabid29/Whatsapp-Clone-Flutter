import 'package:flutter/material.dart';
import 'package:whatsapp_clone_flutter/screens/home/chats/widgets/custom_card.dart';
import 'package:whatsapp_clone_flutter/screens/home/chats/model/chat.dart';
import 'package:whatsapp_clone_flutter/screens/home/contacts/contacts_screen.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<ChatModel> chats = [
      ChatModel(
        name: "Ammar",
        icon: "person.svg",
        isGroup: false,
        time: "5:45 am",
        currentMessage: "Lorem lorem",
        status: 'busy',
      ),
      ChatModel(
        name: "Aron",
        icon: "person.svg",
        isGroup: false,
        time: "8:00 am",
        currentMessage: "Hello",
        status: "can't talk whatsapp only",
      ),
      ChatModel(
        name: "Friends",
        icon: "groups.svg",
        isGroup: true,
        time: "10:00 am",
        currentMessage: "Hy everyone",
        status: "Good Friends",
      ),
      ChatModel(
        name: "Abid",
        icon: "person.svg",
        isGroup: false,
        time: "11:05 am",
        currentMessage: "Aoa",
        status: "Available",
      ),
      ChatModel(
        name: "Classmates",
        icon: "groups.svg",
        isGroup: true,
        time: "12:56 pm",
        currentMessage: "Lorem lorem",
        status: "Final year students",
      ),
    ];

    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: chats.length,
              itemBuilder: (context, index) {
                return CustomCard(chatModel: chats[index]);
              },
            ),
          ),
        ],
      ),
      floatingActionButton: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (ctx) => const ContactsScreen(),
            ),
          );
        },
        child: CircleAvatar(
          radius: 30,
          backgroundColor: const Color(0XFF008665),
          child: Image.asset("assets/images/comment.png"),
        ),
      ),
    );
  }
}
