import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:me_chat/chat/screens/chat_screen.dart';
import 'package:me_chat/models/contact_chat_model.dart';
import 'package:intl/intl.dart';

class ChatItem extends StatelessWidget {
  final ContactChat contactChat;
  const ChatItem({super.key, required this.contactChat});

  @override
  Widget build(BuildContext context) {
    bool pinned = false;
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          ChatScreen.routeName,
          arguments: {
            'name': contactChat.name,
            'uId': contactChat.contactId,
          },
        );
      },
      child: ListTile(
        leading: Hero(
          tag: 'image',
          child:
              CircleAvatar(backgroundImage: NetworkImage(contactChat.profilePic)
                  // AssetImage(
                  //   'assets/images/user_placeholder.png',
                  // ),
                  ),
        ),
        // Sender or group photo, should be clickable for some type of data preview
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              contactChat.name,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              DateFormat.Hm().format(contactChat.timeSent),
            ),
            //Date of last message/Time if today OR Just "Yesterday"
          ],
        ),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              contactChat.lastMessage,
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
