import 'package:flutter/material.dart';
import 'package:me_chat/common/colors.dart';
import 'package:me_chat/settings/widgets/settings_screens_app_bar.dart';

InkWell helpSettingsItem(
    {required String title, required Icon icon, String? subtitle}) {
  return InkWell(
    onTap: () {},
    child: ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      leading: icon,
      title: Text(title),
      subtitle: subtitle != null ? Text(subtitle) : null,
    ),
  );
}

class HelpSettingsScreen extends StatelessWidget {
  static const routeName = '/help-settings';
  const HelpSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.myWhite,
      appBar: settingsScreensAppBar('Help', []),
      body: SafeArea(
        child: Column(
          children: [
            helpSettingsItem(
              title: 'HelpCenter',
              icon: const Icon(Icons.help_outline),
            ),
            helpSettingsItem(
                title: 'Contact us',
                icon: const Icon(Icons.group),
                subtitle: 'Questions? Need help?'),
            helpSettingsItem(
              title: 'Terms and Privacy Policy',
              icon: const Icon(Icons.description),
            ),
            helpSettingsItem(
              title: 'App info',
              icon: const Icon(Icons.info_outline),
            ),
          ],
        ),
      ),
    );
  }
}
