import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:me_chat/auth/controller/auth_controller.dart';
import 'package:me_chat/chat/repositories/chat_repository.dart';
import 'package:me_chat/common/enums/message_enums.dart';
import 'package:me_chat/common/providers/message_reply_provider.dart';
import 'package:me_chat/models/contact_chat_model.dart';
import 'package:me_chat/models/message_model.dart';

final chatControllerProvider = Provider((ref) {
  final chatRepository = ref.watch(chatRepositoryProvider);
  return ChatController(
    chatRepository: chatRepository,
    ref: ref,
  );
});

class ChatController {
  final ChatRepository chatRepository;
  final ProviderRef ref;
  ChatController({
    required this.chatRepository,
    required this.ref,
  });

  void sendTextMessage({
    required BuildContext context,
    required String message,
    required String recieverUserId,
  }) {
    final messageReply = ref.read(messageReplyProvider);
    ref.read(userDataAuthProvider).whenData(
          (senderUserData) => chatRepository.sendTextMessage(
            messageReply: messageReply,
            context: context,
            message: message,
            recieverUserId: recieverUserId,
            senderUserData: senderUserData!,
          ),
        );
    ref.read(messageReplyProvider.state).update((state) => null);
  }

  void sendGIF({
    required BuildContext context,
    required String gifUrl,
    required String recieverUserId,
  }) {
    const String gifUrlPrefix = 'https://i.giphy.com/media/';
    int gifUrlSuffixindex = gifUrl.lastIndexOf('-') + 1;
    String gifUrlSuffix = gifUrl.substring(gifUrlSuffixindex);
    String newGifUrl = '$gifUrlPrefix$gifUrlSuffix/200.gif';
    final messageReply = ref.read(messageReplyProvider);
    ref.read(userDataAuthProvider).whenData(
          (senderUserData) => chatRepository.sendGIF(
            messageReply: messageReply,
            context: context,
            gifUrl: newGifUrl,
            recieverUserId: recieverUserId,
            senderUserData: senderUserData!,
          ),
        );
    ref.read(messageReplyProvider.state).update((state) => null);
  }

  void sendFileMessage({
    required BuildContext context,
    required File file,
    required String recieverUserId,
    required MessageEnum messageEnum,
  }) {
    final messageReply = ref.read(messageReplyProvider);
    ref.read(userDataAuthProvider).whenData(
          (senderUserData) => chatRepository.sendFileMessage(
            context: context,
            messageReply: messageReply,
            file: file,
            recieverUserId: recieverUserId,
            senderUserData: senderUserData!,
            ref: ref,
            messageEnum: messageEnum,
          ),
        );
    ref.read(messageReplyProvider.state).update((state) => null);
  }

  Stream<List<ContactChat>> getContactChats() {
    return chatRepository.getContactChats();
  }

  Stream<List<Message>> getChatMessages(String recieverUserId) {
    return chatRepository.getChatMessages(recieverUserId);
  }

  void setAsSeen({
    required BuildContext context,
    required String recieverUserId,
    required String messageId,
  }) {
    chatRepository.setAsSeen(
      context: context,
      recieverUserId: recieverUserId,
      messageId: messageId,
    );
  }
}
