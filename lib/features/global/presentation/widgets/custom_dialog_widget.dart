import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:whatsapp_clone/core/config/config.dart';

Future<T?> showAlertDialog<T>({
  required BuildContext context,
  required CustomContenTextShowAlertDialog customContenTextShowAlertDialog,
  required CustomActionButtonsShowAlertDialog
      customActionButtonsShowAlertDialog,
  bool? barrierDismissible = true,
  List<Widget>? content,
  List<Widget>? actions,
}) {
  return showDialog<T>(
    context: context,
    barrierDismissible: barrierDismissible!,
    builder: (context) {
      return AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            customContenTextShowAlertDialog,
            if (content != null) ...content,
          ],
        ),
        contentPadding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        actionsPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              if (actions != null) ...actions,
              customActionButtonsShowAlertDialog,
            ],
          ),
        ],
      );
    },
  );
}

Future<void> showErrorDialog(BuildContext context, String message) async {
  await showAlertDialog<void>(
    context: context,
    customContenTextShowAlertDialog: CustomContenTextShowAlertDialog(
      message: message,
    ),
    customActionButtonsShowAlertDialog:
        const CustomActionButtonsShowAlertDialog(
      message: 'Ok',
    ),
  );
}

class CustomActionButtonsShowAlertDialog extends StatelessWidget {
  const CustomActionButtonsShowAlertDialog({
    required this.message,
    super.key,
    this.funtion,
    this.style = const TextStyle(color: AppThemeColors.greenColorOne),
  });
  final String message;
  final void Function()? funtion;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        (funtion != null) ? funtion!() : context.pop();
      },
      child: Text(message, style: style),
    );
  }
}

class CustomContenTextShowAlertDialog extends StatelessWidget {
  const CustomContenTextShowAlertDialog({
    required this.message,
    super.key,
    this.style = const TextStyle(
      color: AppThemeColors.whiteColor,
      fontSize: 15,
    ),
  });

  final String message;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Text(message, style: style);
  }
}
