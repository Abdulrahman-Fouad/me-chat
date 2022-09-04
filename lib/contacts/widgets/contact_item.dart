import 'package:flutter/material.dart';
import 'package:me_chat/chat/screens/chat_screen.dart';

class ContactItem extends StatelessWidget {
  final String name;
  final String about;
  const ContactItem({
    super.key,
    this.about = '',
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, ChatScreen.routeName);
      },
      child: ListTile(
        leading: const Hero(
          tag: 'image',
          child: CircleAvatar(
            backgroundImage: AssetImage(
              'assets/images/user_placeholder.png',
            ),
          ),
        ),
        // Contact photo, should be clickable for some type of data preview
        title: Text(
          name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          about,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
