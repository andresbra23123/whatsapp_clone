import 'package:flutter/material.dart';
import 'package:whatsapp_clone/core/core.dart';

class ContinueButtomWidget extends StatelessWidget {
  const ContinueButtomWidget({
    required this.text,
    super.key,
    this.onPressed,
    this.backgroundColor = AppThemeColors.greenColorOne,
    this.textcolor = AppThemeColors.blackColor,
  });

  final String text;
  final Color? backgroundColor;
  final Color? textcolor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 40,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(color: textcolor),
        ),
      ),
    );
  }
}
