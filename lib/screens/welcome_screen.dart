import 'package:flutter/material.dart';
import 'package:me_chat/constants/colors.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.myIsabelline,
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 30),
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Welcome to ME Chat',
              style: TextStyle(
                fontSize: 26,
                color: MyColors.myTealGreen,
              ),
            ),
            const CircleAvatar(
              backgroundImage: AssetImage('assets/images/chat_background.jpg'),
              radius: 80,
            ),
            RichText(
              textAlign: TextAlign.center,
              text: const TextSpan(
                text: 'Read our ',
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 15,
                ),
                children: [
                  TextSpan(
                      text: 'Privacy Policy. ',
                      style: TextStyle(color: MyColors.myLightGreen)),
                  TextSpan(text: 'Tap "Agree and continue" to acceot the '),
                  TextSpan(
                      text: 'Terms of Service.',
                      style: TextStyle(color: MyColors.myLightGreen)),
                ],
              ),
            ),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(MyColors.myLightGreen)),
              onPressed: () {},
              child: const Text('Agree and Continue'),
            ),
          ],
        ),
      ),
    );
  }
}
