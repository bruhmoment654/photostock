import 'package:flutter/material.dart';

class ErrorMessageWidget extends StatelessWidget {
  const ErrorMessageWidget({super.key, this.refreshCallback});

  final void Function()? refreshCallback;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        const Icon(
          Icons.error,
          size: 100,
          color: Colors.red,
        ),
        Text(
          'Error while getting data, check your internet connection.',
          textAlign: TextAlign.center,
          style: textTheme.titleMedium?.copyWith(color: Colors.red),
        ),
        IconButton(
          onPressed: refreshCallback,
          icon: const Icon(Icons.refresh),
        )
      ],
    );
  }
}
