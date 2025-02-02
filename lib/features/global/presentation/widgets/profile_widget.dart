import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/core/core.dart';

// Todo: ProfileWidget pendiente en im pelementar
class ProfileWidget extends StatelessWidget {
  const ProfileWidget({super.key, this.imageUrl, this.image});
  final String? imageUrl;
  final File? image;

  @override
  Widget build(BuildContext context) {
    if (image != null) {
      return Image.file(
        image!,
        fit: BoxFit.cover,
      );
    }

    if (imageUrl?.isNotEmpty ?? false) {
      return CachedNetworkImage(
        imageUrl: imageUrl!,
        fit: BoxFit.cover,
        progressIndicatorBuilder: (context, url, downloadProgress) =>
            const CircularProgressIndicator(color: AppThemeColors.tabColor),
        errorWidget: (context, url, error) => Image.asset(
          'assets/profile_default.png',
          fit: BoxFit.cover,
        ),
      );
    }

    return Image.asset(
      'assets/profile_default.png',
      fit: BoxFit.cover,
    );
  }
}
