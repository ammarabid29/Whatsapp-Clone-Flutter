import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:whatsapp_clone_flutter/screens/home/chats/model/chat.dart';
import 'package:whatsapp_clone_flutter/widgets/ui_helper.dart';

class ContactCard extends StatelessWidget {
  const ContactCard({super.key, required this.contact});
  final ChatModel contact;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SizedBox(
        width: 50,
        height: 53,
        child: Stack(
          children: [
            CircleAvatar(
              radius: 23,
              backgroundColor: Colors.blueGrey,
              child: SvgPicture.asset(
                "assets/images/person.svg",
                height: 37,
                width: 37,
              ),
            ),
            contact.select
                ? const Positioned(
                    bottom: 4,
                    right: 5,
                    child: CircleAvatar(
                      backgroundColor: Colors.teal,
                      radius: 11,
                      child: Icon(Icons.check, color: Colors.white, size: 18),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
      title: UiHelper.customText(
          text: contact.name.toString(),
          height: 16,
          fontWeight: FontWeight.bold),
      subtitle: UiHelper.customText(
        text: contact.status.toString(),
        height: 14,
      ),
    );
  }
}
