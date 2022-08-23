import 'package:flutter/material.dart';
import 'package:me_chat/constants/colors.dart';
import 'package:me_chat/widgets/settings_screens_app_bar.dart';

class StorageSettingsScreen extends StatelessWidget {
  static const routeName = '/storage-settings';
  const StorageSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.myWintergreenDream,
      appBar: settingsScreensAppBar('Storage and data'),
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Card(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero),
                margin: EdgeInsets.zero,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: const ListTile(
                        enabled: true,
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        leading: Icon(Icons.folder),
                        title: Text('Manage storage'),
                        subtitle: Text('500 MB'),
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(height: 0.5),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const ListTile(
                      leading: Icon(Icons.data_saver_off_outlined),
                      title: Text('Network usage'),
                      subtitle: Text('300 MB sent • 3.0 GB recieved'), //·
                    ),
                    ListTile(
                      leading: const CircleAvatar(
                          backgroundColor: Colors.transparent),
                      title: const Text('Use less datafor calls'),
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 16, horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Media auto download',
                            style: TextStyle(
                              color: Theme.of(context).disabledColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Text(
                              'Voice messages are always automatically downloaded',
                              style: TextStyle(
                                color: Theme.of(context).disabledColor,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const ListTile(
                      leading:
                          CircleAvatar(backgroundColor: Colors.transparent),
                      title: Text('When using mobile data'),
                      subtitle: Text('No media'),
                    ),
                    const ListTile(
                      leading:
                          CircleAvatar(backgroundColor: Colors.transparent),
                      title: Text('When connected on Wi-Fi'),
                      subtitle: Text('No media'),
                    ),
                    const ListTile(
                      leading:
                          CircleAvatar(backgroundColor: Colors.transparent),
                      title: Text('When roaming'),
                      subtitle: Text('No media'),
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
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Media upload quality',
                            style: TextStyle(
                              color: Theme.of(context).disabledColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Text(
                              'Choose the quality of media files to be sent',
                              style: TextStyle(
                                color: Theme.of(context).disabledColor,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const ListTile(
                      leading:
                          CircleAvatar(backgroundColor: Colors.transparent),
                      title: Text('Photo upload quality'),
                      subtitle: Text('Auto (recomended)'),
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
