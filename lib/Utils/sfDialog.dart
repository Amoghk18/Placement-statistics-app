import 'package:flutter/material.dart';

void customDialog(
    String title, String content, List<Widget> actions, BuildContext context) {
  showDialog(
    context: context,
    builder: (ctx) => AlertDialog(
      title: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      content: Text(content),
      actions: actions,
    ),
  );
}
