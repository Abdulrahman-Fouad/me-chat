import 'package:flutter/material.dart';
import 'package:me_chat/constants/colors.dart';

AppBar settingsScreensAppBar(String title) {
  return AppBar(
    backgroundColor: MyColors.myWintergreenDream,
    leading: const BackButton(),
    title: Text(
      title,
      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    ),
  );
}
