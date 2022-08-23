import 'package:flutter/material.dart';
import 'package:me_chat/constants/colors.dart';

Widget messageBubble(BuildContext context) {
  return Wrap(
    children: [
      Container(
        decoration: const BoxDecoration(
          color: MyColors.myLightGreen,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
            bottomLeft: Radius.circular(12),
            bottomRight: Radius.circular(0),
          ),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 12,
        ),
        margin: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 4,
        ),
        child: const Text(
          'This is an example of how the message should look like',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
    ],
  );
}
