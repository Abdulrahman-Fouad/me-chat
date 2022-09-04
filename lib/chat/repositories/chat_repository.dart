import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:me_chat/common/enums/message_enums.dart';
import 'package:me_chat/common/providers/message_reply_provider.dart';
import 'package:me_chat/common/repositories/common_firebase_storage_repository.dart';
import 'package:me_chat/common/utils.dart';
import 'package:me_chat/models/contact_chat_model.dart';
import 'package:me_chat/models/message_model.dart';
import 'package:me_chat/models/user_model.dart';
import 'package:uuid/uuid.dart';

final chatRepositoryProvider = Provider(
  (ref) => ChatRepository(
    FirebaseFirestore.instance,
    FirebaseAuth.instance,
  ),
);

class ChatRepository {
  final FirebaseFirestore firestore;
  final FirebaseAuth auth;

  ChatRepository(this.firestore, this.auth);

  void _saveDataToContactsSubCollection({
    required UserModel senderUserData,
    required UserModel recieverUserData,
    required String message,
    required DateTime timeSent,
    required String recieverUserId,
  }) async {
    var recieverContactChat = ContactChat(
      name: senderUserData.name,
      profilePic: senderUserData.profilePic,
      contactId: senderUserData.uId,
      lastMessage: message,
      timeSent: timeSent,
    );
    await firestore
        .collection('users')
        .doc(recieverUserId)
        .collection('chats')
        .doc(auth.currentUser!.uid)
        .set(
          recieverContactChat.toMap(),
        );
    var senderContactChat = ContactChat(
      name: recieverUserData.name,
      profilePic: recieverUserData.profilePic,
      contactId: recieverUserData.uId,
      lastMessage: message,
      timeSent: timeSent,
    );
    await firestore
        .collection('users')
        .doc(auth.currentUser!.uid)
        .collection('chats')
        .doc(recieverUserId)
        .set(
          senderContactChat.toMap(),
        );
  }

  void _saveDataToMessagesSubCollection({
    required String recieverUserId,
    required String recieverUserName,
    required String senderUserName,
    required String message,
    required String messageId,
    required DateTime timeSent,
    required MessageEnum type,
    required MessageReply? messageReply,
  }) async {
    var chatMessage = Message(
      senderId: auth.currentUser!.uid,
      recieverId: recieverUserId,
      message: message,
      timeSent: timeSent,
      messageId: messageId,
      isSeen: false,
      type: type,
      repliedMessage: messageReply == null ? '' : messageReply.message,
      repliedMessageType:
          messageReply == null ? MessageEnum.text : messageReply.messageEnum,
      repliedTo: messageReply == null
          ? ''
          : messageReply.isMe
              ? senderUserName
              : recieverUserName,
    );
    await firestore
        .collection('users')
        .doc(auth.currentUser!.uid)
        .collection('chats')
        .doc(recieverUserId)
        .collection('messages')
        .doc(messageId)
        .set(
          chatMessage.toMap(),
        );

    await firestore
        .collection('users')
        .doc(recieverUserId)
        .collection('chats')
        .doc(auth.currentUser!.uid)
        .collection('messages')
        .doc(messageId)
        .set(
          chatMessage.toMap(),
        );
  }

  void sendTextMessage({
    required BuildContext context,
    required String message,
    required String recieverUserId,
    required UserModel senderUserData,
    required MessageReply? messageReply,
  }) async {
    try {
      var timeSent = DateTime.now();
      UserModel recieverUserData;

      var recieverUserDataMap =
          await firestore.collection('users').doc(recieverUserId).get();
      recieverUserData = UserModel.fromMap(recieverUserDataMap.data()!);

      var messageId = const Uuid().v1();
      _saveDataToContactsSubCollection(
        senderUserData: senderUserData,
        recieverUserData: recieverUserData,
        message: message,
        timeSent: timeSent,
        recieverUserId: recieverUserId,
      );
      _saveDataToMessagesSubCollection(
        recieverUserId: recieverUserId,
        recieverUserName: recieverUserData.name,
        senderUserName: senderUserData.name,
        message: message,
        messageId: messageId,
        timeSent: timeSent,
        type: MessageEnum.text,
        messageReply: messageReply,
      );
    } catch (e) {
      showSnackBar(context: context, title: e.toString());
    }
  }

  void sendGIF({
    required BuildContext context,
    required String gifUrl,
    required String recieverUserId,
    required UserModel senderUserData,
    required MessageReply? messageReply,
  }) async {
    try {
      var timeSent = DateTime.now();
      UserModel recieverUserData;

      var recieverUserDataMap =
          await firestore.collection('users').doc(recieverUserId).get();
      recieverUserData = UserModel.fromMap(recieverUserDataMap.data()!);

      var messageId = const Uuid().v1();
      _saveDataToContactsSubCollection(
        senderUserData: senderUserData,
        recieverUserData: recieverUserData,
        message: 'GIF',
        timeSent: timeSent,
        recieverUserId: recieverUserId,
      );
      _saveDataToMessagesSubCollection(
        recieverUserId: recieverUserId,
        recieverUserName: recieverUserData.name,
        senderUserName: senderUserData.name,
        message: gifUrl,
        messageId: messageId,
        timeSent: timeSent,
        type: MessageEnum.gif,
        messageReply: messageReply,
      );
    } catch (e) {
      showSnackBar(context: context, title: e.toString());
    }
  }

  void sendFileMessage({
    required BuildContext context,
    required File file,
    required String recieverUserId,
    required UserModel senderUserData,
    required ProviderRef ref,
    required MessageEnum messageEnum,
    required MessageReply? messageReply,
  }) async {
    try {
      var timeSent = DateTime.now();
      UserModel recieverUserData;
      var messageId = const Uuid().v1();

      var recieverUserDataMap =
          await firestore.collection('users').doc(recieverUserId).get();
      recieverUserData = UserModel.fromMap(recieverUserDataMap.data()!);

      final fileUrl = await ref
          .read(commonFirebaseStorageRepositoryProvider)
          .storeFileToFirebase(
            'chat/${messageEnum.type}/${senderUserData.uId}/$recieverUserId/$messageId',
            file,
          );

      String contactMessage;

      switch (messageEnum) {
        case MessageEnum.audio:
          contactMessage = '🎵 Audio';
          break;
        case MessageEnum.image:
          contactMessage = '📷 Photo';
          break;
        case MessageEnum.video:
          contactMessage = '🎥 Video';
          break;
        case MessageEnum.gif:
          contactMessage = 'GIF';
          break;
        case MessageEnum.text:
          contactMessage = 'TEXT';
          break;
      }

      _saveDataToContactsSubCollection(
        senderUserData: senderUserData,
        recieverUserData: recieverUserData,
        message: contactMessage,
        timeSent: timeSent,
        recieverUserId: recieverUserId,
      );
      _saveDataToMessagesSubCollection(
        recieverUserId: recieverUserId,
        recieverUserName: recieverUserData.name,
        senderUserName: senderUserData.name,
        message: fileUrl,
        messageId: messageId,
        timeSent: timeSent,
        type: messageEnum,
        messageReply: messageReply,
      );
    } catch (e) {
      showSnackBar(context: context, title: e.toString());
    }
  }

  Stream<List<ContactChat>> getContactChats() {
    return firestore
        .collection('users')
        .doc(auth.currentUser!.uid)
        .collection('chats')
        .snapshots()
        .asyncMap((event) async {
      List<ContactChat> contacts = [];
      for (var doc in event.docs) {
        var contactChat = ContactChat.fromMap(doc.data());
        contacts.add(
          ContactChat(
            name: contactChat.name,
            profilePic: contactChat.profilePic,
            contactId: contactChat.contactId,
            lastMessage: contactChat.lastMessage,
            timeSent: contactChat.timeSent,
          ),
        );
      }
      return contacts;
    });
  }

  Stream<List<Message>> getChatMessages(String recieverUserId) {
    return firestore
        .collection('users')
        .doc(recieverUserId)
        .collection('chats')
        .doc(auth.currentUser!.uid)
        .collection('messages')
        .orderBy('timeSent')
        .snapshots()
        .asyncMap((event) async {
      List<Message> messages = [];
      for (var doc in event.docs) {
        var chatMessage = Message.fromMap(doc.data());
        messages.add(
          Message(
            senderId: chatMessage.senderId,
            recieverId: chatMessage.recieverId,
            message: chatMessage.message,
            timeSent: chatMessage.timeSent,
            messageId: chatMessage.messageId,
            isSeen: chatMessage.isSeen,
            type: chatMessage.type,
            repliedMessage: chatMessage.repliedMessage,
            repliedMessageType: chatMessage.repliedMessageType,
            repliedTo: chatMessage.repliedTo,
          ),
        );
      }
      return messages;
    });
  }

  void setAsSeen({
    required BuildContext context,
    required String recieverUserId,
    required String messageId,
  }) async {
    try {
      await firestore
          .collection('users')
          .doc(auth.currentUser!.uid)
          .collection('chats')
          .doc(recieverUserId)
          .collection('messages')
          .doc(messageId)
          .update({
        'isSeen': true,
      });

      await firestore
          .collection('users')
          .doc(recieverUserId)
          .collection('chats')
          .doc(auth.currentUser!.uid)
          .collection('messages')
          .doc(messageId)
          .update({
        'isSeen': true,
      });
    } catch (e) {
      showSnackBar(context: context, title: e.toString());
    }
  }
}
