import 'package:app/core/design/navigator.dart';
import 'package:flutter/material.dart';

enum MessageType { success, warning, error }

Future<void> appShowMsg(
    String msg, {
      MessageType type = MessageType.success,
      Duration duration = const Duration(seconds: 6),
      VoidCallback? onTap,
      bool showCloseIcon = false,
    }) async {
  final BuildContext context = navigatorKey.currentContext!;

  Color getBackgroundColor() {
    switch (type) {
      case MessageType.success:
        return Colors.green;
      case MessageType.warning:
        return Colors.orange;
      case MessageType.error:
        return Colors.red;
    }
  }

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        msg,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
      duration: duration,
      backgroundColor: getBackgroundColor(),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      action: showCloseIcon
          ? SnackBarAction(
        label: 'Dismiss',
        textColor: Colors.white,
        onPressed: () {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        },
      )
          : null,
    ),
  );
}