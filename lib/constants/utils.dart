import 'package:flutter/material.dart';

void showSnackBar({required BuildContext context, required String title}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        title,
      ),
    ),
  );
}
