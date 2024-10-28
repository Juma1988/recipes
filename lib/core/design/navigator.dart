import 'package:flutter/material.dart';

final navigatorKey = GlobalKey<NavigatorState>();

Future AppGoto(
  Widget page, {
  bool keepHistory = true,
  bool isReplacement = false,
}) {
  if (isReplacement) {
    return Navigator.pushReplacement(
      navigatorKey.currentContext!,
      MaterialPageRoute(
        builder: (context) => page,
      ),
    );
  }
  return Navigator.pushAndRemoveUntil(
    navigatorKey.currentContext!,
    MaterialPageRoute(
      builder: (Context) => page,
    ),
    (route) => keepHistory,
  );
}
