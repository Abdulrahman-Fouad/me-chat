import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import 'package:me_chat/chat/controller/chat_controller.dart';
import 'package:me_chat/chat/widgets/message_bubble.dart';
import 'package:me_chat/common/enums/message_enums.dart';
import 'package:me_chat/common/loading_spinner.dart';
import 'package:me_chat/common/providers/message_reply_provider.dart';
import 'package:me_chat/models/message_model.dart';

class ChatList extends ConsumerStatefulWidget {
  final String recieverUserId;
  const ChatList({
    super.key,
    required this.recieverUserId,
  });

  @override
  ConsumerState<ChatList> createState() => _ChatListState();
}

class _ChatListState extends ConsumerState<ChatList> {
  final ScrollController chatController = ScrollController();

  void onReplySwipe({
    required String message,
    required bool isMe,
    required MessageEnum messageEnum,
  }) {
    ref.read(messageReplyProvider.state).update(
          (state) => MessageReply(
            message: message,
            isMe: isMe,
            messageEnum: messageEnum,
          ),
        );
  }

  @override
  void dispose() {
    chatController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Message>>(
        stream: ref
            .watch(chatControllerProvider)
            .getChatMessages(widget.recieverUserId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LoadingSpinner();
          }
          SchedulerBinding.instance.addPostFrameCallback(
            (timeStamp) {
              chatController.jumpTo(
                chatController.position.maxScrollExtent,
              );
            },
          );
          return ListView.builder(
            controller: chatController,
            itemCount: snapshot.data!.length,
            itemBuilder: (context, i) {
              final message = snapshot.data![i];
              final timeSent =
                  DateFormat.jm().format(message.timeSent).toLowerCase();
              if (!message.isSeen &&
                  message.recieverId ==
                      FirebaseAuth.instance.currentUser!.uid) {
                ref.read(chatControllerProvider).setAsSeen(
                      context: context,
                      recieverUserId: widget.recieverUserId,
                      messageId: message.messageId,
                    );
              }
              if (message.senderId == FirebaseAuth.instance.currentUser!.uid) {
                return SenderBubble(
                  message: message.message,
                  timeSent: timeSent,
                  type: message.type,
                  repliedText: message.repliedMessage,
                  repliedMessageType: message.repliedMessageType,
                  userName: message.repliedTo,
                  onRightSwipe: () => onReplySwipe(
                    message: message.message,
                    isMe: true,
                    messageEnum: message.type,
                  ),
                  isSeen: message.isSeen,
                );
              }
              return RecieverBubble(
                message: message.message,
                timeSent: timeSent,
                type: message.type,
                repliedText: message.repliedMessage,
                repliedMessageType: message.repliedMessageType,
                userName: message.repliedTo,
                onRightSwipe: () => onReplySwipe(
                  message: message.message,
                  isMe: false,
                  messageEnum: message.type,
                ),
              );
            },
          );
        });
  }
}
