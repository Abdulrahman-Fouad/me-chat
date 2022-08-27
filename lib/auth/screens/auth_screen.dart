import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:me_chat/auth/controller/auth_controller.dart';
import 'package:me_chat/constants/colors.dart';
import 'package:me_chat/constants/custom_button.dart';
import 'package:country_picker/country_picker.dart';

class AuthScreen extends ConsumerStatefulWidget {
  static const routeName = '/auth-screen';
  const AuthScreen({super.key});

  @override
  ConsumerState<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends ConsumerState<AuthScreen> {
  final phoneController = TextEditingController();
  Country? _country;
  bool isPicked = false;

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }

  void pickCountry() {
    showCountryPicker(
      countryListTheme:
          const CountryListThemeData(backgroundColor: MyColors.backgroundColor),
      context: context,
      showPhoneCode: true,
      onSelect: (Country country) {
        setState(() {
          _country = country;
          isPicked = true;
        });
      },
    );
  }

  void sendPhoneNumber() {
    String phoneNumber = phoneController.text.trim();
    if (phoneNumber.isNotEmpty && _country != null) {
      ref
          .read(authControllerProvider)
          .signinWithPhone(context, '+${_country!.phoneCode}$phoneNumber');
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.backgroundColor,
        title: const Text('Enter your phone number'),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Me Chat will need you to verify your phone number',
                  textAlign: TextAlign.center,
                ),
                TextButton(
                  onPressed: pickCountry,
                  child: const Text('Pick country'),
                ),
                Row(
                  children: [
                    isPicked
                        ? Row(
                            children: [
                              Text(_country!.flagEmoji),
                              const SizedBox(
                                width: 3,
                              ),
                              Text('+${_country!.phoneCode}'),
                            ],
                          )
                        : Container(),
                    const SizedBox(width: 10),
                    SizedBox(
                      width: size.width * .7,
                      child: TextField(
                        controller: phoneController,
                        decoration:
                            const InputDecoration(hintText: 'phone number'),
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.phone,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              width: 90,
              child: CustomButton(
                onPressed: sendPhoneNumber,
                text: 'Next',
              ),
            )
          ],
        ),
      ),
    );
  }
}
