import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:me_chat/auth/controller/auth_controller.dart';
import 'package:me_chat/common/loading_spinner.dart';
import 'package:me_chat/common/screens/error_screen.dart';
import 'package:me_chat/main_mobile_layout/screens/main_screen.dart';
import 'package:me_chat/main_mobile_layout/screens/welcome_screen.dart';
import 'app_router.dart';
import 'common/colors.dart';
import 'firebase_options.dart';

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

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
      home: ref.watch(userDataAuthProvider).when(
            data: (user) {
              if (user == null) {
                return const WelcomeScreen();
              }
              return const MainScreen();
            },
            error: (error, stackTrace) => ErrorScreen(
              error: error.toString(),
            ),
            // Todo edit the spinner to be overlaying not a screen
            loading: () => const LoadingSpinner(),
          ),
    );
  }
}
