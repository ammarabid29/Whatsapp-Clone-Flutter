import 'package:flutter/material.dart';
import 'package:whatsapp_clone_flutter/screens/home/chats/model/chat.dart';
import 'package:whatsapp_clone_flutter/screens/home/contacts/group/widgets/avatar.dart';
import 'package:whatsapp_clone_flutter/screens/home/contacts/widgets/contact_card.dart';
import 'package:whatsapp_clone_flutter/widgets/ui_helper.dart';

class CreateGroup extends StatefulWidget {
  const CreateGroup({super.key});

  @override
  State<CreateGroup> createState() => _CreateGroupState();
}

class _CreateGroupState extends State<CreateGroup> {
  List<ChatModel> contacts = [
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

  List<ChatModel> groupMembers = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UiHelper.customText(
              text: "New Group",
              height: 19,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            UiHelper.customText(
              text: "Add participants ",
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
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 12),
        child: Column(
          children: [
            if (groupMembers.isNotEmpty)
              Container(
                height: 75,
                color: Colors.white,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: contacts.length,
                  itemBuilder: (ctx, index) {
                    if (contacts[index].select == true) {
                      return InkWell(
                          onTap: () {
                            setState(() {
                              contacts[index].select = false;
                              groupMembers.remove(contacts[index]);
                            });
                          },
                          child: AvatarCard(contact: contacts[index]));
                    } else {
                      return Container();
                    }
                  },
                ),
              ),
            if (groupMembers.isNotEmpty) const Divider(thickness: 1),
            Expanded(
              child: ListView.builder(
                itemCount: contacts.length,
                itemBuilder: (ctx, index) {
                  return InkWell(
                    onTap: () {
                      if (contacts[index].select == false) {
                        setState(() {
                          contacts[index].select = true;
                          groupMembers.add(contacts[index]);
                        });
                      } else {
                        setState(() {
                          contacts[index].select = false;
                          groupMembers.remove(contacts[index]);
                        });
                      }
                    },
                    child: ContactCard(
                      contact: contacts[index],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
