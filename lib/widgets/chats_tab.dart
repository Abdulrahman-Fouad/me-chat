import 'package:flutter/material.dart';
import 'package:me_chat/widgets/chat_item.dart';

class ChatsTab extends StatelessWidget {
  const ChatsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: 1,
      itemBuilder: (context, index) => const ChatItem(),
    );
  }
}
