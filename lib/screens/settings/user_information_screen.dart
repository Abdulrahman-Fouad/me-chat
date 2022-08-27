import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:me_chat/auth/controller/auth_controller.dart';
import 'package:me_chat/constants/custom_button.dart';
import 'package:me_chat/constants/utils.dart';

class UserInfoScreen extends ConsumerStatefulWidget {
  static const routeName = '/user-info-screen';
  const UserInfoScreen({super.key});

  @override
  ConsumerState<UserInfoScreen> createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends ConsumerState<UserInfoScreen> {
  final TextEditingController nameController = TextEditingController();
  File? image;
  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  void pickImage() async {
    image = await pickImageFromGallery(context);
    setState(() {});
  }

  void storeUserData() async {
    String name = nameController.text.trim();
    if (name.isNotEmpty) {
      ref.read(authControllerProvider).saveUserDataToFirebase(
            name: name,
            profilePic: image,
            context: context,
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Profile info',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                        textAlign: TextAlign.center,
                        'Please provide your name and an optional profile photo'),
                    const SizedBox(height: 20),
                    InkWell(
                      onTap: () => pickImage(),
                      child: image == null
                          ? const CircleAvatar(
                              radius: 64,
                              backgroundImage: AssetImage(
                                  'assets/images/user_placeholder.png'),
                            )
                          : CircleAvatar(
                              radius: 64,
                              backgroundImage: FileImage(image!),
                            ),
                    ),
                    const SizedBox(height: 18),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: nameController,
                            decoration: const InputDecoration(
                              isDense: true,
                              hintText: 'Type your name here',
                            ),
                          ),
                        ),
                        IconButton(
                          padding: const EdgeInsets.only(left: 4),
                          constraints: const BoxConstraints(),
                          onPressed: () {},
                          icon: const Icon(Icons.emoji_emotions_outlined),
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(
                  width: 90,
                  child: CustomButton(
                    onPressed: storeUserData,
                    text: 'Next',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
