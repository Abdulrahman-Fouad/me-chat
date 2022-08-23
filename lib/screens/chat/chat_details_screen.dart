import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:me_chat/constants/colors.dart';

class ChatDetailsScreen extends StatelessWidget {
  const ChatDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: MyColors.myWhite,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    children: [
                      Column(
                        children: const [
                          Hero(
                            tag: 'image',
                            child: CircleAvatar(
                              backgroundImage: AssetImage(
                                  'assets/images/user_placeholder.png'),
                              radius: 60,
                            ),
                          ),
                          ListTile(
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 50),
                            title: Text(
                              'Sender/group name',
                              style: TextStyle(fontSize: 26),
                              textAlign: TextAlign.center,
                            ),
                            subtitle: Text(
                              '+201020586845',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .75,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                IconButton(
                                  icon: const Icon(
                                    Icons.call,
                                    size: 30,
                                    color: MyColors.myWintergreenDream,
                                  ),
                                  onPressed: () {},
                                ),
                                const Text(
                                  'Audio',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: MyColors.myWintergreenDream,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                IconButton(
                                  icon: const Icon(
                                    Icons.videocam_rounded,
                                    size: 30,
                                    color: MyColors.myWintergreenDream,
                                  ),
                                  onPressed: () {},
                                ),
                                const Text(
                                  'Video',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: MyColors.myWintergreenDream,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                IconButton(
                                  icon: const Icon(
                                    (Icons.search),
                                    size: 30,
                                    color: MyColors.myWintergreenDream,
                                  ),
                                  onPressed: () {},
                                ),
                                const Text(
                                  'Search',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: MyColors.myWintergreenDream,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * .015),
              Container(
                color: MyColors.myWhite,
                child: const Center(
                  child: ListTile(
                    title: Text('Sender/group about'),
                    subtitle: Text('18 Aug'),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * .015),
              Container(
                color: MyColors.myWhite,
                child: SizedBox(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Media, links and docs'),
                            Row(
                              children: const [
                                Text('4'),
                                Icon(
                                  CupertinoIcons.right_chevron,
                                  size: 15,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      SingleChildScrollView(
                        padding: const EdgeInsets.only(
                            bottom: 10, left: 12, right: 12),
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 4),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: SizedBox(
                                  height:
                                      MediaQuery.of(context).size.width * .3,
                                  width: MediaQuery.of(context).size.width * .3,
                                  child: Image.asset(
                                    'assets/images/chat_background.jpg',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 4),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: SizedBox(
                                  height:
                                      MediaQuery.of(context).size.width * .3,
                                  width: MediaQuery.of(context).size.width * .3,
                                  child: Image.asset(
                                    'assets/images/chat_background.jpg',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 4),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: SizedBox(
                                  height:
                                      MediaQuery.of(context).size.width * .3,
                                  width: MediaQuery.of(context).size.width * .3,
                                  child: Image.asset(
                                    'assets/images/chat_background.jpg',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 4),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: SizedBox(
                                  height:
                                      MediaQuery.of(context).size.width * .3,
                                  width: MediaQuery.of(context).size.width * .3,
                                  child: Image.asset(
                                    'assets/images/chat_background.jpg',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * .015),
              Container(
                color: MyColors.myWhite,
                child: Column(
                  children: [
                    ListTile(
                      leading: const Icon(Icons.notifications),
                      title: const Text('Mute notifications'),
                      trailing: Switch(
                        value: false,
                        onChanged: (_) {},
                        activeColor: MyColors.myWintergreenDream,
                        inactiveThumbColor: Colors.blueGrey[400],
                        inactiveTrackColor: Colors.grey[300],
                      ),
                    ),
                    const ListTile(
                      leading: Icon(Icons.music_note_rounded),
                      title: Text('Custom notifications'),
                    ),
                    const ListTile(
                      leading: Icon(Icons.image),
                      title: Text('Media visability'),
                    ),
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * .015),
              Container(
                color: MyColors.myWhite,
                child: Column(
                  children: const [
                    ListTile(
                      contentPadding:
                          EdgeInsets.only(top: 8, right: 16, left: 16),
                      leading: Icon(Icons.lock),
                      title: Text('Encryption'),
                      subtitle: Text(
                        'Messages and calls are end to end encrypted. Tap to verify.',
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.av_timer_rounded),
                      title: Text('Disappearing messages'),
                      subtitle: Text(
                        'off',
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * .015),
              Container(
                color: MyColors.myWhite,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 16, top: 12, bottom: 6),
                      child: Text(
                        'No groups in common',
                        style: TextStyle(
                          color: Theme.of(context).disabledColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    const ListTile(
                      leading: CircleAvatar(
                        backgroundColor: MyColors.myWintergreenDream,
                        child: Icon(Icons.group),
                      ),
                      title: Text('Create group with (Sender)'),
                    ),
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * .015),
              Container(
                color: MyColors.myWhite,
                child: Column(
                  children: [
                    ListTile(
                      textColor: Theme.of(context).errorColor,
                      leading: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        child: Icon(
                          Icons.block,
                          color: Theme.of(context).errorColor,
                        ),
                      ),
                      title: const Text('Block (Sender)'),
                    ),
                    ListTile(
                      textColor: Theme.of(context).errorColor,
                      leading: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        child: Icon(
                          Icons.thumb_down,
                          color: Theme.of(context).errorColor,
                        ),
                      ),
                      title: const Text('Report (Sender)'),
                    ),
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * .07),
            ],
          ),
        ),
      ),
    );
  }
}
