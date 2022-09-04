import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:me_chat/chat/widgets/video_message_previewer.dart';
import 'package:me_chat/common/enums/message_enums.dart';
import 'package:cached_network_image/cached_network_image.dart';

class MessageByType extends StatelessWidget {
  final String message;
  final MessageEnum type;
  const MessageByType({
    super.key,
    required this.type,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    bool isPlaying = false;
    final AudioPlayer audioPlayer = AudioPlayer();
    return type == MessageEnum.text
        ? Text(
            message,
            style: const TextStyle(
              fontSize: 16,
            ),
          )
        : type == MessageEnum.image
            ? CachedNetworkImage(
                imageUrl: message,
              )
            : type == MessageEnum.gif
                ? CachedNetworkImage(
                    imageUrl: message,
                  )
                : type == MessageEnum.video
                    ? VideoMessagePreviewer(
                        videoUrl: message,
                      )
                    : type == MessageEnum.audio
                        ? StatefulBuilder(builder: (context, setstate) {
                            return IconButton(
                                constraints:
                                    const BoxConstraints(maxWidth: 150),
                                onPressed: () async {
                                  audioPlayer.setReleaseMode(ReleaseMode.stop);
                                  if (isPlaying) {
                                    audioPlayer.pause();
                                  } else {
                                    await audioPlayer.play(UrlSource(message));
                                  }
                                  setstate(
                                    () => isPlaying = !isPlaying,
                                  );
                                },
                                icon: Icon(isPlaying
                                    ? Icons.pause_circle
                                    : Icons.play_circle));
                          })
                        : Container();
  }
}
