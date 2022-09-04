import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:me_chat/auth/screens/auth_screen.dart';
import 'package:me_chat/common/colors.dart';
import 'package:me_chat/auth/widgets/custom_elevated_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(height: height / 12),
            const Text(
              'Welcome to ME Chat',
              style: TextStyle(
                fontSize: 26,
                color: MyColors.tabColor,
              ),
            ),
            SizedBox(height: height / 9),
            Image.asset(
              'assets/images/bg.png',
              color: MyColors.tabColor,
              height: height / 3,
              width: height / 3,
            ),
            SizedBox(height: height / 9),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'Read our ',
                  style: const TextStyle(
                    color: MyColors.greyColor,
                    fontSize: 15,
                  ),
                  children: [
                    TextSpan(
                        text: 'Privacy Policy. ',
                        recognizer: TapGestureRecognizer()..onTap = () {},
                        style: const TextStyle(color: MyColors.tabColor)),
                    const TextSpan(
                        text: 'Tap "Agree and continue" to acceot the '),
                    TextSpan(
                        text: 'Terms of Service.',
                        recognizer: TapGestureRecognizer()..onTap = () {},
                        style: const TextStyle(color: MyColors.tabColor)),
                  ],
                ),
              ),
            ),
            SizedBox(height: height / 18),
            SizedBox(
              width: width * .75,
              child: CustomButton(
                text: 'Agree and Continue',
                onPressed: () {
                  Navigator.pushNamed(context, AuthScreen.routeName);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
