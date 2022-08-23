import 'package:flutter/material.dart';
import 'package:me_chat/widgets/settings_screens_app_bar.dart';

class AccountSettingsScreen extends StatelessWidget {
  static const routeName = '/account-settings';
  const AccountSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: settingsScreensAppBar('Account'),
      body: SafeArea(
        child: Column(
          children: const [
            ListTile(leading: Icon(Icons.lock), title: Text('Privacy')),
            ListTile(leading: Icon(Icons.security), title: Text('Security')),
            ListTile(
                leading: Icon(Icons.more),
                title: Text('Two-step verification')),
            ListTile(leading: Icon(Icons.logout), title: Text('Change number')),
            ListTile(
                leading: Icon(Icons.description),
                title: Text('Request account info')),
            ListTile(
                leading: Icon(Icons.delete), title: Text('Delete my account')),
          ],
        ),
      ),
    );
  }
}
