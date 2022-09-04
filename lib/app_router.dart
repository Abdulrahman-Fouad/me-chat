import 'package:flutter/material.dart';
import 'package:me_chat/auth/screens/auth_screen.dart';
import 'package:me_chat/auth/screens/otp_screen.dart';
import 'package:me_chat/chat/screens/chat_screen.dart';
import 'package:me_chat/main_mobile_layout/screens/main_screen.dart';
import 'package:me_chat/settings/screens/account_settings_screen.dart';
import 'package:me_chat/settings/screens/chats_settings_screen.dart';
import 'package:me_chat/settings/screens/help_settings_screen.dart';
import 'package:me_chat/settings/screens/notification_settings_screen.dart';
import 'package:me_chat/settings/screens/settings_screen.dart';
import 'package:me_chat/settings/screens/storag_settings_screen.dart';
import 'package:me_chat/settings/screens/user_information_screen.dart';

import 'contacts/screens/select_contact_screen.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case MainScreen.routeName:
      return MaterialPageRoute(builder: (context) => const MainScreen());

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
      final arguments = settings.arguments as Map<String, dynamic>;
      final name = arguments['name'];
      final uId = arguments['uId'];
      return MaterialPageRoute(
          builder: (context) => ChatScreen(
                name: name,
                uId: uId,
              ));

    case OTPScreen.routeName:
      final String verificationId = settings.arguments as String;
      return MaterialPageRoute(
          builder: (context) => OTPScreen(verificationId: verificationId));

    case UserInfoScreen.routeName:
      return MaterialPageRoute(builder: (context) => const UserInfoScreen());

    case SelectContatcScreen.routeName:
      return MaterialPageRoute(
          builder: (context) => const SelectContatcScreen());

    default:
      return MaterialPageRoute(builder: (context) => const MainScreen());
  }
}
