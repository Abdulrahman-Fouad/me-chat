import 'package:flutter/material.dart';
import 'package:me_chat/screens/main_screen.dart';
import 'package:me_chat/screens/settings/account_settings_screen.dart';
import 'package:me_chat/screens/settings/chats_settings_screen.dart';
import 'package:me_chat/screens/settings/notification_settings_screen.dart';
import 'package:me_chat/screens/settings/settings_screen.dart';
import 'package:me_chat/screens/settings/storag_settings_screen.dart';

import 'screens/settings/help_settings_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Me Chat',
      theme: ThemeData(
          // primarySwatch:
          ),
      home: const MainScreen(),
      routes: {
        SettingsScreen.routeName: (context) => SettingsScreen(),
        AccountSettingsScreen.routeName: (context) =>
            const AccountSettingsScreen(),
        ChatsSettingsScreen.routeName: (context) => const ChatsSettingsScreen(),
        NotificationsSettingsScreen.routeName: (context) =>
            const NotificationsSettingsScreen(),
        StorageSettingsScreen.routeName: (context) =>
            const StorageSettingsScreen(),
        HelpSettingsScreen.routeName: (context) => const HelpSettingsScreen(),
      },
    );
  }
}
