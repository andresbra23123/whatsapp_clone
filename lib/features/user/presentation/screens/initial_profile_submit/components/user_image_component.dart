import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:whatsapp_clone/core/core.dart';
import 'package:whatsapp_clone/features/global/presentation/functions/funtions.dart';
import 'package:whatsapp_clone/features/global/presentation/widgets/widget.dart';

class UserImageCompoenent extends StatelessWidget {
  const UserImageCompoenent({super.key});

  @override
  Widget build(BuildContext context) {
    File? imageFile;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: GestureDetector(
        onTap: () => profileImageOptionShowModalBottomSheet(
          context: context,
          hasImage: true,
          hasAvatar: true,
          deleteImage: () {},
          openGallery: () async {
            final file = await selectImageFile(context);
            if (file != null) imageFile = file;
            customLog('imageFile: $imageFile');
            // setState(() {});
            context.pop();
          },
          openCamera: () {},
        ),
        child: Container(
          width: 130,
          height: 130,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(70),
            color: AppThemeColors.bottomAttachContainerColor,
          ),
          child: ClipOval(
            child: imageFile != null
                ? Image.file(
                    imageFile!,
                    width: 130, // Tamaño del círculo
                    height: 130,
                    fit: BoxFit.cover, // Tamaño del círculo
                  )
                : const Icon(
                    Icons.add_a_photo_rounded,
                    size: 50,
                    color: AppThemeColors.greyColor,
                  ),
          ),
        ),
      ),
    );
  }
}
