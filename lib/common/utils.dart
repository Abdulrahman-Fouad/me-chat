import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:enough_giphy_flutter/enough_giphy_flutter.dart';

void showSnackBar({required BuildContext context, required String title}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        title,
      ),
    ),
  );
}

Future<File?> pickImageFromGallery(BuildContext context) async {
  File? image;
  try {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      image = File(pickedImage.path);
    }
  } on Exception catch (e) {
    showSnackBar(context: context, title: e.toString());
  }
  return image;
}

Future<File?> pickVideoFromGallery(BuildContext context) async {
  File? video;
  try {
    final pickedVideo =
        await ImagePicker().pickVideo(source: ImageSource.gallery);
    if (pickedVideo != null) {
      video = File(pickedVideo.path);
    }
  } on Exception catch (e) {
    showSnackBar(context: context, title: e.toString());
  }
  return video;
}

// Future<GiphyGif?> pickGIF(BuildContext context) async {
//   GiphyGif? gif;
//   try {
//     gif = await Giphy.getGif(
//         context: context, apiKey: 'H711ykPFL1JIyIxNU6Tg00gJk7puYhmf');
//   } catch (e) {
//     showSnackBar(
//       context: context,
//       title: e.toString(),
//     );
//   }
//   return gif;
// }
