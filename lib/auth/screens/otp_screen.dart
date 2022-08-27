import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:me_chat/auth/controller/auth_controller.dart';
import 'package:me_chat/constants/colors.dart';

class OTPScreen extends ConsumerWidget {
  static const String routeName = '/otp-screen';
  final String verificationId;
  const OTPScreen({super.key, required this.verificationId});

  void verifyOTP(BuildContext context, WidgetRef ref, String userOTP) {
    ref
        .read(authControllerProvider)
        .verifyOTP(context, userOTP, verificationId);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.backgroundColor,
        title: const Text('Verifying your number'),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: [
              const Text('We have sent SMS with a code'),
              SizedBox(
                width: size.width * .5,
                //TODO Edit it to auto fill with the SMS and redirect the user to the main screen showing an overlaying spinner
                child: TextField(
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                    hintText: '- - - - - -',
                    hintStyle: TextStyle(fontSize: 30),
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    if (value.length == 6) {
                      verifyOTP(context, ref, value.trim());
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
