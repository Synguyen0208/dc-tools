import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ErrorArguments {
  final String? message;
  final String? title;

  ErrorArguments({
    this.message,
    this.title,
  });
}

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key, this.message, this.title});
  final String? message;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Text(message ?? ''),
          Text(title ?? ''),
        ],
      ),
    );
  }
}
