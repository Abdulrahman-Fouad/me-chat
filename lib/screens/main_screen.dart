import 'package:flutter/material.dart';
import 'package:me_chat/constants/colors.dart';
import 'package:me_chat/widgets/calls_tab.dart';
import 'package:me_chat/widgets/camera_tab.dart';
import 'package:me_chat/widgets/main_screen_app_bar.dart';
import 'package:me_chat/widgets/chats_tab.dart';
import 'package:me_chat/widgets/status_tab.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  Tab createTab(
      {required BuildContext context,
      required double ratio,
      required Widget child}) {
    return Tab(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * ratio,
        child: Transform(
          transform: Matrix4.translationValues(0, 3, 0),
          child: child,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Tab> myTabs = <Tab>[
      createTab(
        context: context,
        ratio: .1,
        child: const Icon(Icons.camera_alt),
      ),
      createTab(
          context: context,
          ratio: .3,
          child: const Center(child: Text('CHATS'))),
      createTab(
          context: context,
          ratio: .3,
          child: const Center(child: Text('STATUS'))),
      createTab(
          context: context,
          ratio: .3,
          child: const Center(child: Text('CALLS'))),
    ];

    return DefaultTabController(
      length: myTabs.length,
      initialIndex: 1,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          elevation: 10,
          backgroundColor: MyColors.myWintergreenDream,
          child: const Icon(Icons.chat),
        ),
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              mainScreenAppBar(myTabs, context),
            ];
          },
          body: const TabBarView(
            children: [
              CameraTab(),
              ChatsTab(),
              StatusTab(),
              CallsTab(),
            ],
          ),
        ),
      ),
    );
  }
}
