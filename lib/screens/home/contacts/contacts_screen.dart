import 'package:flutter/material.dart';
import 'package:whatsapp_clone_flutter/screens/home/chats/model/chat.dart';
import 'package:whatsapp_clone_flutter/screens/home/contacts/group/create_group.dart';
import 'package:whatsapp_clone_flutter/screens/home/contacts/widgets/button_card.dart';
import 'package:whatsapp_clone_flutter/screens/home/contacts/widgets/contact_card.dart';
import 'package:whatsapp_clone_flutter/widgets/ui_helper.dart';

class ContactsScreen extends StatelessWidget {
  const ContactsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<ChatModel> contactContent = [
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
        name: "Abid",
        icon: "person.svg",
        isGroup: false,
        time: "11:05 am",
        currentMessage: "Aoa",
        status: "Available",
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UiHelper.customText(
              text: "Select Contact",
              height: 19,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            UiHelper.customText(
              text: "257 contacts",
              height: 13,
              color: Colors.white,
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
          PopupMenuButton<String>(
            onSelected: (value) {
              // print(value);
            },
            itemBuilder: (context) {
              return [
                const PopupMenuItem(
                  value: "Invite a friend",
                  child: Text("Invite a friend"),
                ),
                const PopupMenuItem(
                  value: "Contacts",
                  child: Text("Contacts"),
                ),
                const PopupMenuItem(
                  value: "Refresh",
                  child: Text("Refresh"),
                ),
                const PopupMenuItem(
                  value: "Help",
                  child: Text("Help"),
                ),
              ];
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 12),
        child: ListView.builder(
          itemCount: contactContent.length + 2,
          itemBuilder: (ctx, index) {
            if (index == 0) {
              return InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (ctx) => const CreateGroup(),
                    ),
                  );
                },
                child: const ButtonCard(
                  icon: Icons.group,
                  text: "New group",
                ),
              );
            } else if (index == 1) {
              return const ButtonCard(
                icon: Icons.person_add,
                text: "New contact",
              );
            }
            return ContactCard(
              contact: contactContent[index - 2],
            );
          },
        ),
      ),
    );
  }
}
