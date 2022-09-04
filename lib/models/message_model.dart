import 'package:me_chat/common/enums/message_enums.dart';

class Message {
  final String senderId;
  final String recieverId;
  final String message;
  final DateTime timeSent;
  final String messageId;
  final bool isSeen;
  final MessageEnum type;
  final String repliedMessage;
  final String repliedTo;
  final MessageEnum repliedMessageType;
  Message({
    required this.senderId,
    required this.recieverId,
    required this.message,
    required this.timeSent,
    required this.messageId,
    required this.isSeen,
    required this.type,
    required this.repliedMessage,
    required this.repliedTo,
    required this.repliedMessageType,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'senderId': senderId,
      'recieverId': recieverId,
      'message': message,
      'timeSent': timeSent.millisecondsSinceEpoch,
      'messageId': messageId,
      'isSeen': isSeen,
      'type': type.type,
      'repliedMessage': repliedMessage,
      'repliedTo': repliedTo,
      'repliedMessageType': repliedMessageType.type,
    };
  }

  factory Message.fromMap(Map<String, dynamic> map) {
    return Message(
      senderId: map['senderId'] as String,
      recieverId: map['recieverId'] as String,
      message: map['message'] as String,
      timeSent: DateTime.fromMillisecondsSinceEpoch(map['timeSent'] as int),
      messageId: map['messageId'] as String,
      isSeen: map['isSeen'] as bool,
      type: (map['type'] as String).toEnum(),
      repliedMessage: map['repliedMessage'] as String,
      repliedTo: map['repliedTo'] as String,
      repliedMessageType: (map['repliedMessageType'] as String).toEnum(),
    );
  }
}
