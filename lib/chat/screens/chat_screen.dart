import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:me_chat/auth/controller/auth_controller.dart';
import 'package:me_chat/chat/widgets/chat_list.dart';
import 'package:me_chat/chat/widgets/message_bar.dart';
import 'package:me_chat/common/colors.dart';
import 'package:me_chat/models/user_model.dart';
import 'package:me_chat/chat/screens/chat_details_screen.dart';

class ChatScreen extends ConsumerWidget {
  static const routeName = '/chat-screen';
  final String name;
  final String uId;
  const ChatScreen({super.key, required this.name, required this.uId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: chatAppBar(context, name, ref, authControllerProvider, uId),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/backgroundImage.png"),
            fit: BoxFit.fitHeight,
          ),
        ),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
                child: ChatList(
              recieverUserId: uId,
            )),
            MessageBar(
              recieverUserId: uId,
            ),
          ],
        ),
      ),
    );
  }
}

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

AppBar chatAppBar(BuildContext context, String name, WidgetRef ref,
    Provider<AuthController> authControllerProvider, String uId) {
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
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        height: kToolbarHeight,
        width: double.maxFinite,
        child: Align(
          alignment: Alignment.centerLeft,
          child: StreamBuilder<UserModel>(
              stream: ref.read(authControllerProvider).userData(uId),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Container();
                }
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    if (snapshot.data!.isOnline)
                      const Text(
                        'Online',
                        style: TextStyle(fontSize: 10),
                      )
                  ],
                );
              }),
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
