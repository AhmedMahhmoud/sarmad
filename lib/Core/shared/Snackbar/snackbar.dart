import 'package:flutter/material.dart';

class ShowSnackBar {
  static void show({
    required BuildContext context,
    required String message,
    int? secondes,
    bool isSuccess = true,
  }) {
    ScaffoldMessenger.of(context)
        .showSnackBar(
          SnackBar(
            content: Text(
              message,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
            elevation: 1,
            duration: Duration(seconds: secondes ?? 3),
            behavior: SnackBarBehavior.fixed,
            backgroundColor: !isSuccess ? Colors.red : null,
          ),
        )
        .closed
        .then((value) {
      if (context.mounted) ScaffoldMessenger.of(context).clearSnackBars();
    });
  }
}
