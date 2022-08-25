import 'package:flutter/material.dart';
import 'package:me_chat/auth/screens/auth_screen.dart';
import 'package:me_chat/auth/screens/otp_screen.dart';
import 'package:me_chat/screens/chat/chat_screen.dart';
import 'package:me_chat/screens/main_screen.dart';
import 'package:me_chat/screens/settings/account_settings_screen.dart';
import 'package:me_chat/screens/settings/chats_settings_screen.dart';
import 'package:me_chat/screens/settings/help_settings_screen.dart';
import 'package:me_chat/screens/settings/notification_settings_screen.dart';
import 'package:me_chat/screens/settings/settings_screen.dart';
import 'package:me_chat/screens/settings/storag_settings_screen.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SettingsScreen.routeName:
      return MaterialPageRoute(builder: (context) => SettingsScreen());

    case AccountSettingsScreen.routeName:
      return MaterialPageRoute(
          builder: (context) => const AccountSettingsScreen());

    case ChatsSettingsScreen.routeName:
      return MaterialPageRoute(
          builder: (context) => const ChatsSettingsScreen());

    case NotificationsSettingsScreen.routeName:
      return MaterialPageRoute(
          builder: (context) => const NotificationsSettingsScreen());

    case StorageSettingsScreen.routeName:
      return MaterialPageRoute(
          builder: (context) => const StorageSettingsScreen());

    case HelpSettingsScreen.routeName:
      return MaterialPageRoute(
          builder: (context) => const HelpSettingsScreen());

    case AuthScreen.routeName:
      return MaterialPageRoute(builder: (context) => const AuthScreen());

    case ChatScreen.routeName:
      return MaterialPageRoute(builder: (context) => const ChatScreen());

    case OTPScreen.routeName:
      final String verificationId = settings.arguments as String;
      return MaterialPageRoute(
          builder: (context) => OTPScreen(verificationId: verificationId));

    default:
      return MaterialPageRoute(builder: (context) => const MainScreen());
  }
}
