import 'package:flutter/material.dart';
import 'package:whatsapp_clone_flutter/screens/home/contacts/contacts_screen.dart';
import 'package:whatsapp_clone_flutter/widgets/ui_helper.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var arrContent = [
      {
        "image": "assets/images/boarding.png",
        "name": "Aron",
        "lastmsg": "Lorem lorem",
        "time": "5:45 am",
        "msg": "7",
      },
      {
        "image": "assets/images/whatsapp.png",
        "name": "WhatsApp Support",
        "lastmsg": "Lorem ",
        "time": "5:45 am",
        "msg": "1",
      },
      {
        "image": "assets/images/boarding.png",
        "name": "Aron",
        "lastmsg": "Lorem lorem",
        "time": "5:45 am",
        "msg": "7",
      },
      {
        "image": "assets/images/whatsapp.png",
        "name": "WhatsApp Support",
        "lastmsg": "Lorem ",
        "time": "5:45 am",
        "msg": "1",
      },
      {
        "image": "assets/images/boarding.png",
        "name": "Aron",
        "lastmsg": "Lorem lorem",
        "time": "5:45 am",
        "msg": "7",
      },
      {
        "image": "assets/images/whatsapp.png",
        "name": "WhatsApp Support",
        "lastmsg": "Lorem ",
        "time": "5:45 am",
        "msg": "1",
      },
      {
        "image": "assets/images/boarding.png",
        "name": "Aron",
        "lastmsg": "Lorem lorem",
        "time": "5:45 am",
        "msg": "7",
      },
      {
        "image": "assets/images/whatsapp.png",
        "name": "WhatsApp Support",
        "lastmsg": "Lorem ",
        "time": "5:45 am",
        "msg": "1",
      },
    ];

    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: arrContent.length,
              itemBuilder: (context, index) {
                return ListTile(
                  contentPadding: const EdgeInsets.only(right: 14),
                  leading: CircleAvatar(
                    radius: 40,
                    backgroundImage:
                        AssetImage(arrContent[index]["image"].toString()),
                  ),
                  title: UiHelper.customText(
                      text: arrContent[index]["name"].toString(),
                      height: 14,
                      fontWeight: FontWeight.bold),
                  subtitle: UiHelper.customText(
                      text: arrContent[index]["lastmsg"].toString(),
                      height: 13,
                      color: const Color(0XFF889095)),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      UiHelper.customText(
                          text: arrContent[index]["time"].toString(),
                          height: 12,
                          color: const Color(0XFF026500)),
                      const SizedBox(height: 5),
                      CircleAvatar(
                        radius: 10,
                        backgroundColor: const Color(0XFF036A01),
                        child: UiHelper.customText(
                            text: arrContent[index]["msg"].toString(),
                            height: 12,
                            color: Colors.white),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: GestureDetector(
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (ctx) => const ContactsScreen()));
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
