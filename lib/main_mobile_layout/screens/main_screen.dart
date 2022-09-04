import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:me_chat/auth/controller/auth_controller.dart';
import 'package:me_chat/common/colors.dart';
import 'package:me_chat/contacts/screens/select_contact_screen.dart';
import 'package:me_chat/main_mobile_layout/widgets/calls_tab.dart';
import 'package:me_chat/main_mobile_layout/widgets/camera_tab.dart';
import 'package:me_chat/main_mobile_layout/widgets/chats_tab.dart';
import 'package:me_chat/main_mobile_layout/widgets/main_screen_app_bar.dart';
import 'package:me_chat/main_mobile_layout/widgets/status_tab.dart';

class MainScreen extends ConsumerStatefulWidget {
  static const routeName = '/main-screen';
  const MainScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen>
    with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        ref.watch(authControllerProvider).setUserState(true);
        break;
      case AppLifecycleState.inactive:
      case AppLifecycleState.paused:
      case AppLifecycleState.detached:
        ref.watch(authControllerProvider).setUserState(false);
        break;
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

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
          onPressed: () {
            Navigator.pushNamed(context, SelectContatcScreen.routeName);
          },
          elevation: 10,
          backgroundColor: MyColors.tabColor,
          child: const Icon(
            Icons.chat,
            color: Colors.white,
          ),
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
