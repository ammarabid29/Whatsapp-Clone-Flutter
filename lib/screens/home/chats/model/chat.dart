import 'package:uuid/uuid.dart';

class ChatModel {
  final String id;
  final String name;
  final String icon;
  final bool isGroup;
  final String time;
  final String currentMessage;
  final String status;
  bool select;

  ChatModel({
    String? id,
    required this.name,
    required this.icon,
    required this.isGroup,
    required this.time,
    required this.currentMessage,
    required this.status,
    this.select = false,
  }) : id = id ?? const Uuid().v4();
}
