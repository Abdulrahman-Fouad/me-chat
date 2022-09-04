import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:me_chat/chat/controller/chat_controller.dart';
import 'package:me_chat/chat/widgets/chat_item.dart';
import 'package:me_chat/common/loading_spinner.dart';
import 'package:me_chat/models/contact_chat_model.dart';

class ChatsTab extends ConsumerWidget {
  const ChatsTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return StreamBuilder<List<ContactChat>>(
        stream: ref.watch(chatControllerProvider).getContactChats(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LoadingSpinner();
          }
          return ListView.builder(
            // reverse: true,
            padding: EdgeInsets.zero,
            itemCount: snapshot.data!.length,
            itemBuilder: (context, i) {
              var contactChat = snapshot.data![i];
              return ChatItem(contactChat: contactChat);
            },
          );
        });
  }
}
