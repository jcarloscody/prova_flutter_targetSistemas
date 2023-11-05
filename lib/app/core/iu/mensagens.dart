import 'package:flutter/material.dart';

class Messages {
  final BuildContext context;
  Messages._(this.context);

  factory Messages.of(BuildContext buildContext) {
    return Messages._(buildContext);
  }

  void showError(String msg) => _showMessage(msg, Colors.red);

  void showInfo(String msg) => _showMessage(msg, Colors.grey);

  void _showMessage(String msg, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg),
        backgroundColor: color,
      ),
    );
  }
}
