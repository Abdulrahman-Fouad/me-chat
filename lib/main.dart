import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:me_chat/screens/main_screen.dart';
import 'package:me_chat/screens/settings/account_settings_screen.dart';
import 'package:me_chat/screens/settings/chats_settings_screen.dart';
import 'package:me_chat/screens/settings/notification_settings_screen.dart';
import 'package:me_chat/screens/settings/settings_screen.dart';
import 'package:me_chat/screens/settings/storag_settings_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'screens/settings/help_settings_screen.dart';

// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   // If you're going to use other Firebase services in the background, such as Firestore,
//   // make sure you call `initializeApp` before using other Firebase services.
//   await Firebase.initializeApp();

//   print("Handling a background message: ${message.messageId}");
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseMessaging messaging = FirebaseMessaging.instance;
  // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  print('User granted permission: ${settings.authorizationStatus}');
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print('Got a message whilst in the foreground!');
    print('Message data: ${message.data}');

    if (message.notification != null) {
      print('Message also contained a notification: ${message.notification}');
    }
  });
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
