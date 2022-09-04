import 'package:flutter/material.dart';
import 'package:me_chat/common/colors.dart';

AppBar settingsScreensAppBar(String title, List<Widget> actions) {
  return AppBar(
    backgroundColor: MyColors.appBarColor,
    title: Text(
      title,
      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    ),
    actions: actions,
  );
}
