import 'package:flutter/material.dart';
import 'package:me_chat/common/colors.dart';
import 'package:me_chat/chat/screens/chat_details_screen.dart';

enum ChatMenuOptions {
  viewContact,
  media,
  search,
  muteNotifications,
  disappearingMessages,
  wallpaper,
  more,
}

enum ChatMoreOptions {
  report,
  block,
  clearChat,
  exportChat,
  addShortcut,
}

enum GroupChatMenuOptions {
  groupInfo,
  groupMedia,
  search,
  muteNotifications,
  disappearingMessages,
  wallpaper,
  more,
}

enum GroupChatMoreOptions {
  report,
  exitGroup,
  clearChat,
  exportChat,
  addShortcut,
}

AppBar chatAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: MyColors.appBarColor,
    titleSpacing: 0,
    leadingWidth: 70,
    leading: Wrap(
      runSpacing: 10,
      runAlignment: WrapAlignment.center,
      children: [
        TextButton(
          style: ButtonStyle(
            padding: const MaterialStatePropertyAll(EdgeInsets.zero),
            shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100.0))),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: const [
              Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              Hero(
                tag: 'image',
                child: CircleAvatar(
                  radius: 16.0,
                  backgroundImage:
                      AssetImage('assets/images/user_placeholder.png'),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
    title: InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ChatDetailsScreen()),
        );
      },
      child: const SizedBox(
        height: kToolbarHeight,
        width: double.maxFinite,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Sender or group name',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ),
      ),
    ),
    actions: [
      IconButton(onPressed: () {}, icon: const Icon(Icons.videocam_rounded)),
      IconButton(onPressed: () {}, icon: const Icon(Icons.call)),
      PopupMenuButton<ChatMenuOptions>(
        tooltip: 'More Ootions',
        icon: const Icon(Icons.more_vert),
        itemBuilder: (context) {
          return [
            const PopupMenuItem<ChatMenuOptions>(
              value: ChatMenuOptions.viewContact,
              child: Text("View contact"),
            ),
            const PopupMenuItem<ChatMenuOptions>(
              value: ChatMenuOptions.media,
              child: Text("Media"),
            ),
            const PopupMenuItem<ChatMenuOptions>(
              value: ChatMenuOptions.search,
              child: Text("Search"),
            ),
            const PopupMenuItem<ChatMenuOptions>(
              value: ChatMenuOptions.muteNotifications,
              child: Text("Mute notifications"),
            ),
            const PopupMenuItem<ChatMenuOptions>(
              value: ChatMenuOptions.wallpaper,
              child: Text("Wallpaper"),
            ),
            PopupMenuItem<ChatMenuOptions>(
              value: ChatMenuOptions.more,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text("More"),
                  Icon(
                    Icons.arrow_right,
                    color: MyColors.myLightGreen,
                  ),
                ],
              ),
            ),
          ];
        },
      ),
    ],
  );
}
