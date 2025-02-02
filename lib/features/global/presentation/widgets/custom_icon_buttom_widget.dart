import 'package:flutter/material.dart';
import 'package:whatsapp_clone/core/core.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    required this.onPressed,
    required this.icon,
    super.key,
    this.border,
    this.background,
    this.iconColor = AppThemeColors.greyColor,
    this.iconSize = 22,
    this.minWidth = 45,
  });

  final void Function()? onPressed;
  final IconData icon;
  final BoxBorder? border;
  final Color? background;
  final Color? iconColor;
  final double? iconSize;
  final double? minWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: background,
        shape: BoxShape.circle,
        border: border,
      ),
      child: IconButton(
        onPressed: onPressed,
        splashColor: Colors.transparent,
        splashRadius: minWidth! - 25,
        iconSize: iconSize,
        padding: EdgeInsets.zero,
        constraints: BoxConstraints(
          minWidth: minWidth!,
          minHeight: minWidth!,
        ),
        icon: Icon(
          icon,
          color: iconColor,
        ),
      ),
    );
  }
}
