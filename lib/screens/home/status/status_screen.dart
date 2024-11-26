import 'package:flutter/material.dart';
import 'package:whatsapp_clone_flutter/widgets/ui_helper.dart';

class StatusScreen extends StatelessWidget {
  const StatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var statusContent = [
      {
        "img":
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTdQLwDqDwd2JfzifvfBTFT8I7iKFFevcedYg&s",
        "name": "Robert",
        "statusTime": "15 mins ago"
      },
      {
        "img":
            "https://plus.unsplash.com/premium_photo-1678197937465-bdbc4ed95815?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cGVyc29ufGVufDB8fDB8fHww",
        "name": "Micheal",
        "statusTime": "50 mins ago"
      },
      {
        "img":
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQxSbDPGzR7indGAYwhnNVLZc0xPURSYMQy9g&s",
        "name": "Franklin",
        "statusTime": "2 hrs ago"
      }
    ];

    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 30),
          Row(
            children: [
              const SizedBox(width: 20),
              UiHelper.customText(text: "Status", height: 20),
            ],
          ),
          const SizedBox(height: 10),
          ListTile(
            leading: const Padding(
              padding: EdgeInsets.only(left: 5.0),
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: NetworkImage(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSwdIVSqaMsmZyDbr9mDPk06Nss404fosHjLg&s"),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: CircleAvatar(
                      radius: 10,
                      backgroundColor: Color(0XFF008069),
                      child:
                          Icon(Icons.add, color: Color(0XFFFFFFFF), size: 15),
                    ),
                  ),
                ],
              ),
            ),
            title: UiHelper.customText(text: "My Status", height: 20),
            subtitle: UiHelper.customText(
                text: "Tap to add status update", height: 15),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(right: 20, left: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                UiHelper.customText(text: "Recent Updates", height: 15),
                const Icon(
                  Icons.arrow_drop_down,
                  color: Color(0XFF5E5E5E),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: statusContent.length,
              itemBuilder: (ctx, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage:
                        NetworkImage(statusContent[index]["img"].toString()),
                  ),
                  title: UiHelper.customText(
                      text: statusContent[index]['name'].toString(),
                      height: 16,
                      fontWeight: FontWeight.bold),
                  subtitle: UiHelper.customText(
                      text: statusContent[index]['statusTime'].toString(),
                      height: 14),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
