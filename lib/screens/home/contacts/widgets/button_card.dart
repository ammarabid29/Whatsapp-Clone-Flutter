import 'package:flutter/material.dart';
import 'package:whatsapp_clone_flutter/widgets/ui_helper.dart';

class ButtonCard extends StatelessWidget {
  const ButtonCard({super.key, required this.icon, required this.text});
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 23,
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: Icon(
          icon,
          size: 26,
          color: Colors.white,
        ),
      ),
      title: UiHelper.customText(
        text: text,
        height: 16,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
