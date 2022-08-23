import 'package:flutter/material.dart';
import 'package:me_chat/constants/colors.dart';
// import 'package:me_chat/main.dart';
import 'package:me_chat/widgets/chat_item.dart';

class ArchivedScreen extends StatelessWidget {
  const ArchivedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.myWintergreenDream,
      appBar: AppBar(
        backgroundColor: MyColors.myTealGreen,
        leading: const BackButton(),
        title: const Text(
          'Archived',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        actions: [
          PopupMenuButton(
            icon: const Icon(Icons.more_vert),
            itemBuilder: (context) {
              return [
                const PopupMenuItem(
                  // padding: EdgeInsets.zero,
                  child: Text('Archived settings'),
                ),
              ];
            },
          ),
        ],
      ),
      body: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: 2,
        itemBuilder: (context, index) => const ChatItem(),
      ),
    );
  }
}
