import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:me_chat/chat/widgets/message_by_type.dart';
import 'package:me_chat/common/colors.dart';
import 'package:me_chat/common/enums/message_enums.dart';
import 'package:swipe_to/swipe_to.dart';

class SenderBubble extends StatelessWidget {
  final bool isSeen;
  final String message;
  final String timeSent;
  final String repliedText;
  final String userName;
  final MessageEnum type;
  final MessageEnum repliedMessageType;
  final VoidCallback onRightSwipe;

  const SenderBubble({
    Key? key,
    required this.isSeen,
    required this.message,
    required this.timeSent,
    required this.repliedText,
    required this.userName,
    required this.type,
    required this.repliedMessageType,
    required this.onRightSwipe,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isReplying = repliedText.isNotEmpty;
    return SwipeTo(
      onRightSwipe: onRightSwipe,
      child: Align(
        alignment: Alignment.centerRight,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width - 45,
          ),
          child: Bubble(
            radius: const Radius.circular(12),
            padding: const BubbleEdges.symmetric(vertical: 6, horizontal: 10),
            margin: const BubbleEdges.symmetric(vertical: 6, horizontal: 12),
            nip: BubbleNip.rightTop,
            color: MyColors.messageColor,
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.end,
              alignment: WrapAlignment.end,
              children: [
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.end,
                  alignment: WrapAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8, bottom: 8),
                      child: Column(
                        children: [
                          if (isReplying) ...[
                            Text(
                              userName,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 3),
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color:
                                    MyColors.backgroundColor.withOpacity(0.5),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(5),
                                ),
                              ),
                              child: MessageByType(
                                type: repliedMessageType,
                                message: repliedText,
                              ),
                            ),
                            const SizedBox(height: 8),
                          ],
                          MessageByType(
                            type: type,
                            message: message,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      timeSent,
                      style: const TextStyle(
                        fontSize: 13,
                        color: Colors.white60,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Icon(
                      isSeen ? Icons.done_all : Icons.done,
                      size: 20,
                      color: isSeen ? MyColors.myCheckmarkBlue : Colors.white60,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RecieverBubble extends StatelessWidget {
  final String message;
  final String timeSent;
  final MessageEnum type;
  final VoidCallback onRightSwipe;
  final String repliedText;
  final String userName;
  final MessageEnum repliedMessageType;

  const RecieverBubble({
    Key? key,
    required this.message,
    required this.timeSent,
    required this.type,
    required this.onRightSwipe,
    required this.repliedText,
    required this.userName,
    required this.repliedMessageType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isReplying = repliedText.isNotEmpty;
    return SwipeTo(
      onRightSwipe: onRightSwipe,
      child: Align(
        alignment: Alignment.centerLeft,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width - 45,
          ),
          child: Bubble(
            radius: const Radius.circular(12),
            padding: const BubbleEdges.symmetric(vertical: 6, horizontal: 10),
            margin: const BubbleEdges.symmetric(vertical: 6, horizontal: 12),
            nip: BubbleNip.leftTop,
            color: MyColors.senderMessageColor,
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.end,
              alignment: WrapAlignment.end,
              children: [
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.end,
                  alignment: WrapAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8, bottom: 8),
                      child: Column(
                        children: [
                          if (isReplying) ...[
                            Text(
                              userName,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 3),
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color:
                                    MyColors.backgroundColor.withOpacity(0.5),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(5),
                                ),
                              ),
                              child: MessageByType(
                                type: repliedMessageType,
                                message: repliedText,
                              ),
                            ),
                            const SizedBox(height: 8),
                          ],
                          MessageByType(
                            type: type,
                            message: message,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Wrap(
                  children: [
                    Text(
                      timeSent,
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
