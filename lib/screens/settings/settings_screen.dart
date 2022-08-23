import 'dart:math' as math;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:me_chat/constants/colors.dart';
import 'package:me_chat/screens/settings/account_settings_screen.dart';

import 'chats_settings_screen.dart';
import 'help_settings_screen.dart';
import 'notification_settings_screen.dart';
import 'storag_settings_screen.dart';

class SettingsScreen extends StatelessWidget {
  static const routeName = '/settings-screen';
  SettingsScreen({super.key});

  final List settings = [
    {
      'icon': Transform.rotate(
        angle: 90 * math.pi / 180,
        child: const Icon(Icons.key),
      ),
      'title': const Text('Account'),
      'route': AccountSettingsScreen.routeName,
      'subtitle': const Text('Privacy, security, change number'),
    },
    {
      'icon': const Icon(Icons.chat),
      'title': const Text('Chats'),
      'route': ChatsSettingsScreen.routeName,
      'subtitle': const Text('Theme, wallpapers, chat history'),
    },
    {
      'icon': const Icon(Icons.notifications),
      'title': const Text('Notifications'),
      'route': NotificationsSettingsScreen.routeName,
      'subtitle': const Text('Message, group & call tones'),
    },
    {
      'icon': const Icon(Icons.data_saver_off),
      'title': const Text('Storage and data'),
      'route': StorageSettingsScreen.routeName,
      'subtitle': const Text('Network usage, auto-download'),
    },
    {
      'icon': const Icon(Icons.help_outline),
      'title': const Text('Help'),
      'route': HelpSettingsScreen.routeName,
      'subtitle': const Text('Help center, contact us, privacy policy'),
    },
    {
      'icon': const Icon(Icons.group),
      'title': const Text('Invite a friend'),
      'route': null,
      'subtitle': null,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.myWintergreenDream,
        title: const Text('Settings'),
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Column(
            children: [
              InkWell(
                // onLongPress: () {},
                onTap: () {},
                child: ListTile(
                  contentPadding:
                      const EdgeInsets.only(top: 10, right: 8, left: 8),
                  leading: const CircleAvatar(
                      radius: 30,
                      backgroundImage:
                          AssetImage('assets/images/user_placeholder.png')),
                  title: const Text(
                    'User name',
                    style: TextStyle(fontSize: 20),
                  ),
                  subtitle: const Text('User about'),
                  trailing: IconButton(
                    icon: const Icon(
                      CupertinoIcons.qrcode,
                      color: MyColors.myLightGreen,
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
              ...settings
                  .map(
                    (setting) => InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, setting['route']);
                      },
                      child: ListTile(
                        leading: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 10),
                            child: setting['icon']),
                        title: setting['title'],
                        subtitle: setting['subtitle'],
                      ),
                    ),
                  )
                  .toList(),
              const Padding(
                padding: EdgeInsets.only(top: 20),
                child: Center(
                  child: Text('from'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: SizedBox(
                    height: 40,
                    width: 50,
                    child: Center(
                      child: Image.asset(
                        'assets/images/me.png',
                        fit: BoxFit.fitWidth,
                      ),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
