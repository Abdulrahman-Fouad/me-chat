import 'package:flutter/material.dart';
import 'package:me_chat/constants/colors.dart';
import 'package:me_chat/widgets/settings_screens_app_bar.dart';

class ChatsSettingsScreen extends StatelessWidget {
  static const routeName = '/chats-settings';
  const ChatsSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: settingsScreensAppBar('Chats'),
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 20, left: 20, bottom: 12),
                      child: Text(
                        'Display',
                        style: TextStyle(
                          color: Theme.of(context).disabledColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    const ListTile(
                      leading: Icon(Icons.brightness_medium),
                      title: Text('Theme'),
                      subtitle: Text('Dark'),
                    ),
                    const ListTile(
                      leading: Icon(Icons.wallpaper_rounded),
                      title: Text('Wallpaper'),
                    ),
                  ],
                ),
              ),
              const Divider(height: 0.5),
              Container(
                padding: const EdgeInsets.only(bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 20, left: 20, bottom: 12),
                      child: Text(
                        'Chat settings',
                        style: TextStyle(
                          color: Theme.of(context).disabledColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      leading: const CircleAvatar(
                        backgroundColor: Colors.transparent,
                      ),
                      title: const Text('Enter is send'),
                      subtitle: const Text('Enter key will send your message'),
                      trailing: Switch(
                        value: false,
                        onChanged: (value) {},
                        activeColor: MyColors.myWintergreenDream,
                        inactiveThumbColor: Colors.blueGrey[400],
                        inactiveTrackColor: Colors.grey[300],
                      ),
                    ),
                    ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      leading: const CircleAvatar(
                        backgroundColor: Colors.transparent,
                      ),
                      title: const Text('Media Vesability'),
                      subtitle: const Text(
                          'Show newly downloaded mediain your photo\'s gallery'),
                      trailing: Switch(
                        value: false,
                        onChanged: (value) {},
                        activeColor: MyColors.myWintergreenDream,
                        inactiveThumbColor: Colors.blueGrey[400],
                        inactiveTrackColor: Colors.grey[300],
                      ),
                    ),
                    const ListTile(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      leading: CircleAvatar(
                        backgroundColor: Colors.transparent,
                      ),
                      title: Text('Font size'),
                      subtitle: Text('Medium'),
                    ),
                  ],
                ),
              ),
              const Divider(height: 0.5),
              Container(
                padding: const EdgeInsets.only(bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 20, left: 20, bottom: 12),
                      child: Text(
                        'Archived chats',
                        style: TextStyle(
                          color: Theme.of(context).disabledColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      leading: const CircleAvatar(
                        backgroundColor: Colors.transparent,
                      ),
                      title: const Text('Keep chats archived'),
                      subtitle: const Text(
                          'Archived chats will remain archived when you recive a new message'),
                      trailing: Switch(
                        value: true,
                        onChanged: (_) {},
                        activeColor: MyColors.myWintergreenDream,
                        inactiveThumbColor: Colors.blueGrey[400],
                        inactiveTrackColor: Colors.grey[300],
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(height: 0.5),
              Container(
                padding: const EdgeInsets.only(top: 8, bottom: 8),
                child: Column(
                  children: const [
                    ListTile(
                      leading: Icon(Icons.backup),
                      title: Text('Chat backup'),
                    ),
                    ListTile(
                      leading: Icon(Icons.history),
                      title: Text('Chat history'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
