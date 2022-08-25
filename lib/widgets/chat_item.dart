import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:me_chat/screens/chat/chat_screen.dart';

class ChatItem extends StatelessWidget {
  const ChatItem({super.key});

  @override
  Widget build(BuildContext context) {
    bool pinned = false;
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, ChatScreen.routeName);
      },
      child: ListTile(
        leading: const Hero(
          tag: 'image',
          child: CircleAvatar(
            backgroundImage: AssetImage(
              'assets/images/user_placeholder.png',
            ),
          ),
        ),
        // Sender or group photo, should be clickable for some type of data preview
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              'Sender/Group name',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text('Date'),
            //Date of last message/Time if today OR Just "Yesterday"
          ],
        ),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Last message',
              overflow: TextOverflow.ellipsis,
            ),
            // adding pin icon if the chat is pinned else last messsage will take the whole space
            if (pinned)
              // ignore: dead_code
              Transform.rotate(
                angle: 30 * math.pi / 180,
                child: const Icon(Icons.push_pin),
              ),
          ],
        ),
        //with Sender name for groups and reciving status if the user is the sender
      ),
    );
  }
}
