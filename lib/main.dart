import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'app_router.dart';
import 'constants/colors.dart';
import 'firebase_options.dart';
import 'screens/welcome_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Me Chat',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: MyColors.backgroundColor,
        appBarTheme: const AppBarTheme(
          color: MyColors.appBarColor,
        ),
      ),
      onGenerateRoute: (settings) => onGenerateRoute(settings),
      home: const WelcomeScreen(),
      // routes: {
      //   SettingsScreen.routeName: (context) => SettingsScreen(),
      //   AccountSettingsScreen.routeName: (context) => const AccountSettingsScreen(),
      //   ChatsSettingsScreen.routeName: (context) => const ChatsSettingsScreen(),
      //   NotificationsSettingsScreen.routeName: (context) => const NotificationsSettingsScreen(),
      //   StorageSettingsScreen.routeName: (context) => const StorageSettingsScreen(),
      //   HelpSettingsScreen.routeName: (context) => const HelpSettingsScreen(),
      // },
    );
  }
}
