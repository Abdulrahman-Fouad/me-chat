import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:me_chat/constants/colors.dart';
import 'package:me_chat/widgets/chat_app_bar.dart';
import 'package:me_chat/widgets/message_bar.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: chatAppBar(context),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/WhatsApp_wallpaper.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Bubble(
              alignment: Alignment.bottomRight,
              radius: const Radius.circular(12),
              padding: const BubbleEdges.symmetric(vertical: 10, horizontal: 8),
              margin: const BubbleEdges.symmetric(vertical: 6, horizontal: 12),
              nip: BubbleNip.rightTop,
              color: MyColors.myTeaGreen,
              child: const Text(
                'This is an example of how the message should look',
                textAlign: TextAlign.start,
                textWidthBasis: TextWidthBasis.longestLine,
                // softWrap: false,
                style: TextStyle(fontSize: 16),
              ),
            ),
            messageBar(context),
          ],
        ),
      ),
    );
  }
}
