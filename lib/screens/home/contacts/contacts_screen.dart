import 'package:flutter/material.dart';
import 'package:whatsapp_clone_flutter/widgets/ui_helper.dart';

class ContactsScreen extends StatelessWidget {
  const ContactsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var contactContent = [
      {
        "img":
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTdQLwDqDwd2JfzifvfBTFT8I7iKFFevcedYg&s",
        "name": "Robert",
        "status": "Busy"
      },
      {
        "img":
            "https://plus.unsplash.com/premium_photo-1678197937465-bdbc4ed95815?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cGVyc29ufGVufDB8fDB8fHww",
        "name": "Micheal",
        "status": "Available"
      },
      {
        "img":
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQxSbDPGzR7indGAYwhnNVLZc0xPURSYMQy9g&s",
        "name": "Franklin",
        "status": "No call, only whatsapp"
      },
      {
        "img":
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTdQLwDqDwd2JfzifvfBTFT8I7iKFFevcedYg&s",
        "name": "Robert",
        "status": "Busy"
      },
      {
        "img":
            "https://plus.unsplash.com/premium_photo-1678197937465-bdbc4ed95815?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cGVyc29ufGVufDB8fDB8fHww",
        "name": "Micheal",
        "status": "Available"
      },
      {
        "img":
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQxSbDPGzR7indGAYwhnNVLZc0xPURSYMQy9g&s",
        "name": "Franklin",
        "status": "No call, only whatsapp"
      },
      {
        "img":
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTdQLwDqDwd2JfzifvfBTFT8I7iKFFevcedYg&s",
        "name": "Robert",
        "status": "Busy"
      },
      {
        "img":
            "https://plus.unsplash.com/premium_photo-1678197937465-bdbc4ed95815?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cGVyc29ufGVufDB8fDB8fHww",
        "name": "Micheal",
        "status": "Available"
      },
      {
        "img":
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQxSbDPGzR7indGAYwhnNVLZc0xPURSYMQy9g&s",
        "name": "Franklin",
        "status": "No call, only whatsapp"
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: UiHelper.customText(
            text: "Select Contact", height: 16, color: Colors.white),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert_sharp)),
        ],
      ),
      body: ListView.builder(
        itemCount: contactContent.length,
        itemBuilder: (ctx, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage:
                  NetworkImage(contactContent[index]["img"].toString()),
            ),
            title: UiHelper.customText(
                text: contactContent[index]['name'].toString(),
                height: 16,
                fontWeight: FontWeight.bold),
            subtitle: UiHelper.customText(
                text: contactContent[index]['status'].toString(), height: 14),
          );
        },
      ),
    );
  }
}
