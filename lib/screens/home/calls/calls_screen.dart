import 'package:flutter/material.dart';
import 'package:whatsapp_clone_flutter/widgets/ui_helper.dart';

class CallsScreen extends StatelessWidget {
  const CallsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var callContent = [
      {
        "img":
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTdQLwDqDwd2JfzifvfBTFT8I7iKFFevcedYg&s",
        "name": "Robert",
        "callTime": "15 mins ago"
      },
      {
        "img":
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQxSbDPGzR7indGAYwhnNVLZc0xPURSYMQy9g&s",
        "name": "Franklin",
        "callTime": "2 hrs ago"
      },
      {
        "img":
            "https://plus.unsplash.com/premium_photo-1678197937465-bdbc4ed95815?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cGVyc29ufGVufDB8fDB8fHww",
        "name": "Micheal",
        "callTime": "2 days ago"
      },
    ];

    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 20),
          Row(
            children: [
              const SizedBox(width: 20),
              UiHelper.customText(text: "Recent", height: 18),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: callContent.length,
              itemBuilder: (ctx, index) {
                return ListTile(
                  leading: CircleAvatar(
                    radius: 25,
                    backgroundImage: NetworkImage(
                      callContent[index]["img"].toString(),
                    ),
                  ),
                  title: UiHelper.customText(
                      text: callContent[index]['name'].toString(),
                      height: 16,
                      fontWeight: FontWeight.bold),
                  subtitle: UiHelper.customText(
                      text: callContent[index]['callTime'].toString(),
                      height: 14),
                  trailing: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.call,
                      color: Color(0XFF008069),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
