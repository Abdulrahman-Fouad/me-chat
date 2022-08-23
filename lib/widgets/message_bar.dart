import 'dart:math' as math;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:me_chat/constants/colors.dart';

Widget messageBar(BuildContext context) {
  // TextEditingController _controller;
  return Row(
    children: [
      SizedBox(
        width: MediaQuery.of(context).size.width - 60,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          child: TextField(
            // controller: _controller,
            textCapitalization: TextCapitalization.sentences,
            autocorrect: true,
            enableSuggestions: true,
            cursorColor: MyColors.myLightGreen,
            cursorHeight: 20,
            // onChanged: (value) {
            //   setState(() {
            //     _enteredMessage = value;
            //   });
            // },
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
              border: InputBorder.none,
              fillColor: Colors.blueGrey,
              hintText: 'Message',
              hintStyle: const TextStyle(fontSize: 18, color: Colors.blueGrey),
              contentPadding: const EdgeInsets.all(5),
              prefixIcon: CupertinoButton(
                minSize: double.minPositive,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                onPressed: () {},
                child: const Icon(
                  Icons.emoji_emotions_outlined,
                  color: Colors.blueGrey,
                ),
              ),
              suffixIcon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CupertinoButton(
                      minSize: double.minPositive,
                      padding: const EdgeInsets.only(right: 8, left: 4),
                      onPressed: () {},
                      child: Transform.rotate(
                        angle: -45 * math.pi / 180,
                        child: const Icon(
                          Icons.attach_file,
                          color: Colors.blueGrey,
                        ),
                      ),
                    ),
                    CupertinoButton(
                      minSize: double.minPositive,
                      padding: const EdgeInsets.only(right: 4, left: 8),
                      onPressed: () {},
                      child: const Icon(
                        Icons.camera_alt,
                        color: Colors.blueGrey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2),
        child: CircleAvatar(
          radius: 25,
          backgroundColor: MyColors.myWintergreenDream,
          child: IconButton(
            icon: const Icon(
              Icons.mic,
              color: MyColors.myWhite,
            ),
            onPressed: () {},
          ),
        ),
      ),
    ],
  );
}
