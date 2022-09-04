import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:me_chat/chat/widgets/message_by_type.dart';
import 'package:me_chat/common/colors.dart';
import 'package:me_chat/common/providers/message_reply_provider.dart';

class MessageReplyBar extends ConsumerWidget {
  const MessageReplyBar({Key? key}) : super(key: key);

  void cancelReply(WidgetRef ref) {
    ref.read(messageReplyProvider.state).update((state) => null);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final messageReply = ref.watch(messageReplyProvider);
    return Container(
      width: MediaQuery.of(context).size.width - 60,
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
        color: MyColors.myWintergreenDream,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  messageReply!.isMe ? 'You' : 'Other',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              GestureDetector(
                child: const Icon(
                  Icons.close,
                  size: 16,
                ),
                onTap: () => cancelReply(ref),
              )
            ],
          ),
          const SizedBox(height: 8),
          MessageByType(
            type: messageReply.messageEnum,
            message: messageReply.message,
          ),
        ],
      ),
    );
  }
}
