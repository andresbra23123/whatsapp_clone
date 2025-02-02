import 'package:flutter/material.dart';
import 'package:whatsapp_clone/core/core.dart';

class ShortBar extends StatelessWidget {
  const ShortBar({
    super.key,
    this.height = 4,
    this.width = 30,
    this.color = AppThemeColors.greyColor,
  });

  final double? height;
  final double? width;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}
