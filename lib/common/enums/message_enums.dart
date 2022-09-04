enum MessageEnum {
  text('text'),
  audio('audio'),
  image('image'),
  video('video'),
  gif('gif');

  const MessageEnum(this.type);
  final String type;
}

extension ConvertMessage on String {
  MessageEnum toEnum() {
    switch (this) {
      case 'text':
        return MessageEnum.text;

      case 'audio':
        return MessageEnum.audio;

      case 'image':
        return MessageEnum.image;

      case 'video':
        return MessageEnum.video;

      case 'gif':
        return MessageEnum.gif;

      default:
        return MessageEnum.text;
    }
  }
}
