import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:me_chat/chat/controller/chat_controller.dart';
import 'package:me_chat/common/enums/message_enums.dart';
import 'package:permission_handler/permission_handler.dart';

class AudioRecorder extends ConsumerStatefulWidget {
  final String recieverUserId;
  const AudioRecorder({
    super.key,
    required this.recieverUserId,
  });
  @override
  ConsumerState<AudioRecorder> createState() => _AudioRecorderState();
}

class _AudioRecorderState extends ConsumerState<AudioRecorder> {
  @override
  void initState() {
    super.initState();
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

  @override
  void dispose() {
    recorder.closeRecorder();
    super.dispose();
  }

  final recorder = FlutterSoundRecorder();

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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: CircleAvatar(
        radius: 25,
        backgroundColor: const Color(0xFF128C7E),
        child: GestureDetector(
          onTap: () async {
            initRecorder();
            if (recorder.isRecording) {
              await stopRecorder();
              setState(() {});
            } else {
              await startRecord();
              setState(() {});
            }
          },
          child: Icon(
            recorder.isRecording ? Icons.stop : Icons.mic,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
