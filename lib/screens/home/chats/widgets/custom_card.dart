import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:web_socket_channel/io.dart';
import 'package:whatsapp_clone_flutter/screens/home/chats/individual_chat/individual_chat_screen.dart';
import 'package:whatsapp_clone_flutter/screens/home/chats/model/chat.dart';
import 'package:whatsapp_clone_flutter/widgets/ui_helper.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key, required this.chatModel});
  final ChatModel chatModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (ctx) => IndividualChatScreen(
              chatModel: chatModel,
              channel: IOWebSocketChannel.connect("ws://echo.websocket.org"),
            ),
          ),
        );
      },
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              radius: 30,
              backgroundColor: Colors.blueGrey,
              child: SvgPicture.asset(
                chatModel.isGroup
                    ? "assets/images/groups.svg"
                    : "assets/images/person.svg",
                height: 37,
                width: 37,
              ),
            ),
            title: UiHelper.customText(
              text: chatModel.name,
              height: 14,
              fontWeight: FontWeight.bold,
            ),
            subtitle: Row(
              children: [
                const Icon(Icons.done_all),
                const SizedBox(width: 3),
                UiHelper.customText(
                  text: chatModel.currentMessage,
                  height: 13,
                  color: const Color(0XFF889095),
                ),
              ],
            ),
            trailing: UiHelper.customText(
              text: chatModel.time,
              height: 12,
              color: const Color(0XFF026500),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Divider(thickness: 1),
          ),
        ],
      ),
    );
  }
}
