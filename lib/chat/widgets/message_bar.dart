import 'dart:io';
import 'dart:math' as math;

// import 'package:enough_giphy_flutter/enough_giphy_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:me_chat/chat/controller/chat_controller.dart';
import 'package:me_chat/chat/widgets/message_reply_bar.dart';
import 'package:me_chat/common/colors.dart';
import 'package:me_chat/common/enums/message_enums.dart';
import 'package:me_chat/common/providers/message_reply_provider.dart';
import 'package:me_chat/common/utils.dart';
import 'package:permission_handler/permission_handler.dart';

class MessageBar extends ConsumerStatefulWidget {
  final String recieverUserId;
  const MessageBar({
    super.key,
    required this.recieverUserId,
  });

  @override
  ConsumerState<MessageBar> createState() => MessageBarState();
}

class MessageBarState extends ConsumerState<MessageBar> {
  bool isShowEmojiContainer = false;
  bool isShowSendButton = false;
  FocusNode focusNode = FocusNode();
  final recorder = FlutterSoundRecorder();
  final TextEditingController _messageController = TextEditingController();

  @override
  void initState() {
    initRecorder();
    super.initState();
  }

  Future initRecorder() async {
    final status = await Permission.microphone.request();
    if (status != PermissionStatus.granted) {
      throw 'Permission not granted';
    }
    await recorder.openRecorder();
    recorder.setSubscriptionDuration(const Duration(milliseconds: 500));
  }

  Future startRecord() async {
    await recorder.startRecorder(toFile: "audio");
  }

  Future stopRecorder() async {
    final filePath = await recorder.stopRecorder();
    final file = File(filePath!);
    sendFile(
      file: file,
      messageEnum: MessageEnum.audio,
    );
  }

  void hideEmojiPicker() {
    setState(() {
      isShowEmojiContainer = false;
    });
  }

  void showEmojiPicker() {
    setState(() {
      isShowEmojiContainer = true;
    });
  }

  void showKeyboard() => focusNode.requestFocus();
  void hideKeyboard() => focusNode.unfocus();

  void toggleKeyboard() {
    if (isShowEmojiContainer) {
      hideEmojiPicker();
      showKeyboard();
    } else {
      hideKeyboard();
      showEmojiPicker();
    }
  }

  void sendTextMessage() async {
    if (isShowSendButton) {
      ref.read(chatControllerProvider).sendTextMessage(
            context: context,
            message: _messageController.text.trim(),
            recieverUserId: widget.recieverUserId,
          );

      setState(() {
        _messageController.text = '';
        // showSendButton = false;
      });
    } else {
      if (recorder.isRecording) {
        await stopRecorder();
        setState(() {});
      } else {
        await startRecord();
        setState(() {});
      }
    }
  }

  void sendFile({
    required MessageEnum messageEnum,
    required File file,
  }) {
    ref.read(chatControllerProvider).sendFileMessage(
          context: context,
          file: file,
          recieverUserId: widget.recieverUserId,
          messageEnum: messageEnum,
        );
  }

  void selectImage() async {
    File? image = await pickImageFromGallery(context);
    if (image != null) {
      sendFile(messageEnum: MessageEnum.image, file: image);
    }
  }

  void selectVideo() async {
    File? video = await pickVideoFromGallery(context);
    if (video != null) {
      sendFile(messageEnum: MessageEnum.video, file: video);
    }
  }

  // void selectGIF() async {
  //   GiphyGif? gif = await pickGIF(context);
  //   if (gif != null) {
  //     ref.read(chatControllerProvider).sendGIF(
  //           context: context,
  //           gifUrl: gif.url,
  //           recieverUserId: widget.recieverUserId,
  //         );
  //   }
  // }

  @override
  void dispose() {
    super.dispose();
    recorder.closeRecorder();
    _messageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final messageReply = ref.watch(messageReplyProvider);
    final isShowMessageReply = messageReply != null;
    return Column(
      children: [
        if (isShowMessageReply) const MessageReplyBar(),
        Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width - 60,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                child: TextFormField(
                  focusNode: focusNode,
                  controller: _messageController,
                  textCapitalization: TextCapitalization.sentences,
                  enableSuggestions: true,
                  cursorColor: MyColors.tabColor,
                  cursorHeight: 20,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  onChanged: (value) {
                    if (value.trim().isNotEmpty) {
                      setState(() {
                        isShowSendButton = true;
                      });
                    } else {
                      setState(() {
                        isShowSendButton = false;
                      });
                    }
                  },
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    fillColor: Colors.blueGrey,
                    hintText: 'Message',
                    hintStyle:
                        const TextStyle(fontSize: 18, color: Colors.grey),
                    contentPadding: const EdgeInsets.all(5),
                    prefixIcon: CupertinoButton(
                      minSize: double.minPositive,
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      onPressed: toggleKeyboard,
                      child: const Icon(
                        Icons.emoji_emotions_outlined,
                        color: Colors.grey,
                      ),
                    ),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          CupertinoButton(
                            minSize: double.minPositive,
                            padding: const EdgeInsets.only(right: 8, left: 4),
                            onPressed: selectVideo,
                            child: Transform.rotate(
                              angle: -45 * math.pi / 180,
                              child: const Icon(
                                Icons.attach_file,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          if (!isShowSendButton)
                            CupertinoButton(
                              minSize: double.minPositive,
                              padding: const EdgeInsets.only(right: 4, left: 8),
                              onPressed: selectImage,
                              child: const Icon(
                                Icons.camera_alt,
                                color: Colors.grey,
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2),
              child: CircleAvatar(
                radius: 25,
                backgroundColor: const Color(0xFF128C7E),
                child: GestureDetector(
                  onTap: sendTextMessage,
                  child: Icon(
                    isShowSendButton
                        ? Icons.send
                        : recorder.isRecording
                            ? Icons.stop
                            : Icons.mic,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
        if (isShowEmojiContainer)
          SizedBox(
            height: 310,
            child: EmojiPicker(
              onEmojiSelected: ((category, emoji) {
                setState(
                  () {
                    _messageController.text =
                        _messageController.text + emoji.emoji;
                  },
                );

                if (!isShowSendButton) {
                  setState(
                    () {
                      isShowSendButton = true;
                    },
                  );
                }
              }),
            ),
          ),
      ],
    );
  }
}
