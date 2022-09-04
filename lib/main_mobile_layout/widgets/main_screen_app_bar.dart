import 'package:flutter/material.dart';
import 'package:me_chat/common/colors.dart';
import 'package:me_chat/settings/screens/settings_screen.dart';

enum MainMenuOptions {
  newGroup,
  newProdcast,
  linkedDevices,
  starredMessages,
  settings,
}

PopupMenuButton<MainMenuOptions> trailing(BuildContext context) {
  return PopupMenuButton<MainMenuOptions>(
    onSelected: (result) {
      if (result == MainMenuOptions.settings) {
        Navigator.pushNamed(context, SettingsScreen.routeName);
      }
    },
    tooltip: 'More Ootions',
    icon: const Icon(Icons.more_vert),
    itemBuilder: (context) {
      return [
        const PopupMenuItem(child: Text("New Group")),
        const PopupMenuItem(child: Text("New Prodcast")),
        const PopupMenuItem(child: Text("Linked Devices")),
        const PopupMenuItem(child: Text("Starred Messages")),
        const PopupMenuItem(
          value: MainMenuOptions.settings,
          child: Text("Settings"),
        ),
      ];
    },
  );
}

List<Widget> appBarActions(BuildContext context) {
  return [
    IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
    trailing(context)
  ];
}

SliverAppBar mainScreenAppBar(List<Tab> myTabs, BuildContext context) {
  return SliverAppBar(
    backgroundColor: MyColors.myWintergreenDream,
    actions: appBarActions(context),
    title:
        const Text('Me Chat', style: TextStyle(color: MyColors.myIsabelline)),
    elevation: 10,
    pinned: true,
    floating: true,
    bottom: TabBar(
      indicatorWeight: 4,
      labelStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
      labelColor: MyColors.myLightGreen,
      unselectedLabelColor: MyColors.myIsabelline,
      indicatorColor: MyColors.myLightGreen,
      labelPadding: EdgeInsets.zero,
      isScrollable: true,
      tabs: myTabs,
    ),
  );
}
