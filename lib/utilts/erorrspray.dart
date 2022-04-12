import 'package:flutter/material.dart';

class ErrorPray extends StatelessWidget {
  const ErrorPray({Key? key, this.errorMessage, this.onRetryPressed})
      : super(key: key);

  final String? errorMessage;
  final Function? onRetryPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const SizedBox(height: 15),
        Text(
          errorMessage!.isEmpty
              ? 'Unexpected error. Please retry'
              : errorMessage!,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 8),
        ElevatedButton(
          child: const Text('Retry', style: TextStyle(color: Colors.black)),
          onPressed: onRetryPressed as void Function()?,
        ),
        const SizedBox(height: 100),
      ],
    );
  }
}