import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<void> showAlertDialog({
  required BuildContext context,
  required String title,
  required String content,
  required String defaultActionText,
  void Function()? onOkPressed,
}) async {
  if (Platform.isIOS) {
    return showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: RichText(
          text: TextSpan(
            text: title,
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        content: RichText(
          text: TextSpan(
            text: content,
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        actions: <Widget>[
          CupertinoDialogAction(
            onPressed: onOkPressed,
            child: RichText(
              text: TextSpan(
                text: defaultActionText,
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: RichText(
        text: TextSpan(
          text: title,
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      content: RichText(
        text: TextSpan(
          text: content,
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: onOkPressed,
          child: RichText(
            text: TextSpan(
              text: defaultActionText,
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
