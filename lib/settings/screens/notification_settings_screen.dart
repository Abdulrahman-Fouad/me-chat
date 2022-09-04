import 'package:flutter/material.dart';
import 'package:me_chat/common/colors.dart';
import 'package:me_chat/settings/widgets/settings_screens_app_bar.dart';

class NotificationsSettingsScreen extends StatelessWidget {
  static const routeName = '/notifications-settings';
  const NotificationsSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.myWintergreenDream,
      appBar: settingsScreensAppBar('Notifications', []),
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        title: const Text('Conversation tones'),
                        subtitle: const Text(
                            'Play sounds for incoming and outgoing messages'),
                        trailing: Switch(
                          value: true,
                          onChanged: (_) {},
                          activeColor: MyColors.myWintergreenDream,
                          inactiveThumbColor: Colors.blueGrey[400],
                          inactiveTrackColor: Colors.grey[300],
                        ),
                      ),
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
                      padding: const EdgeInsets.only(top: 20, left: 20),
                      child: Text(
                        'Messages',
                        style: TextStyle(
                          color: Theme.of(context).disabledColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    const ListTile(
                      title: Text('Notification tone'),
                      subtitle: Text('Default ringtone (Bongo)'),
                    ),
                    const ListTile(
                      title: Text('Vibrate'),
                      subtitle: Text('Default'),
                    ),
                    const ListTile(
                      title: Text('Popup notification'),
                      subtitle: Text('No popup'),
                    ),
                    const ListTile(
                      title: Text('Light'),
                      subtitle: Text('Purble'),
                    ),
                    ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      title: const Text('Use high priority notifications'),
                      subtitle: const Text(
                          'Show previews of notifications at the top of the screen'),
                      trailing: Switch(
                        value: true,
                        onChanged: (value) {},
                        activeColor: MyColors.myWintergreenDream,
                        inactiveThumbColor: Colors.blueGrey[400],
                        inactiveTrackColor: Colors.grey[300],
                      ),
                    ),
                    ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      title: const Text('Reaction notifications'),
                      subtitle: const Text(
                          'Show notifications for reactions of messages you send'),
                      trailing: Switch(
                        value: true,
                        onChanged: (value) {},
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
                padding: const EdgeInsets.only(bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20, left: 20),
                      child: Text(
                        'Groups',
                        style: TextStyle(
                          color: Theme.of(context).disabledColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    const ListTile(
                      title: Text('Notification tone'),
                      subtitle: Text('Default ringtone (Bongo)'),
                    ),
                    const ListTile(
                      title: Text('Vibrate'),
                      subtitle: Text('Default'),
                    ),
                    const ListTile(
                      title: Text('Popup notification'),
                      subtitle: Text('No popup'),
                    ),
                    const ListTile(
                      title: Text('Light'),
                      subtitle: Text('White'),
                    ),
                    ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      title: const Text('Use high priority notifications'),
                      subtitle: const Text(
                          'Show previews of notifications at the top of the screen'),
                      trailing: Switch(
                        value: true,
                        onChanged: (value) {},
                        activeColor: MyColors.myWintergreenDream,
                        inactiveThumbColor: Colors.blueGrey[400],
                        inactiveTrackColor: Colors.grey[300],
                      ),
                    ),
                    ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      title: const Text('Reaction notifications'),
                      subtitle: const Text(
                          'Show notifications for reactions of messages you send'),
                      trailing: Switch(
                        value: true,
                        onChanged: (value) {},
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
                padding: const EdgeInsets.only(bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20, left: 20),
                      child: Text(
                        'Calls',
                        style: TextStyle(
                          color: Theme.of(context).disabledColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    const ListTile(
                      title: Text('Ringtone'),
                      subtitle: Text('Default ringtone ()'),
                    ),
                    const ListTile(
                      title: Text('Vibrate'),
                      subtitle: Text('Default'),
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
