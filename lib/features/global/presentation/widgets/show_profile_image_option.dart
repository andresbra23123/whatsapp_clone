import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:whatsapp_clone/core/core.dart';
import 'package:whatsapp_clone/features/global/presentation/widgets/widget.dart';

Future<void> profileImageOptionShowModalBottomSheet({
  required BuildContext context,
  bool hasImage = false,
  bool hasAvatar = false,
  void Function()? deleteImage,
  void Function()? openCamera,
  void Function()? openGallery,
  void Function()? openAvatar,
}) {
  return showModalBottomSheet<void>(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(10),
        topRight: Radius.circular(10),
      ),
    ),
    backgroundColor: AppThemeColors.backgroundBottomSheetColor,
    builder: (BuildContext context) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const ShortBar(),
          ListTile(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            leading: IconButton(
              onPressed: () => context.pop(),
              icon: const Icon(Icons.close),
            ),
            title: const Text(
              'Profile photo',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
            ),
            trailing: hasImage
                ? IconButton(
                    onPressed: deleteImage,
                    icon: const Icon(Icons.delete_forever_outlined),
                  )
                : const SizedBox.shrink(),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                imagePickerIcon(
                  icon: Icons.camera_alt_outlined,
                  text: 'Camera',
                  onPressed: openCamera,
                ),
                imagePickerIcon(
                  icon: Icons.image,
                  text: 'Gallery',
                  onPressed: openGallery,
                ),
                if (hasAvatar)
                  imagePickerIcon(
                    icon: Icons.person_3_outlined,
                    text: 'Avatar',
                    onPressed: openGallery,
                  ),
              ],
            ),
          ),
        ],
      );
    },
  );
}

Widget imagePickerIcon({
  required String text,
  required IconData icon,
  void Function()? onPressed,
}) {
  return Column(
    children: [
      CustomIconButton(
        onPressed: onPressed,
        icon: icon,
        iconColor: AppThemeColors.greenColorOne,
        minWidth: 50,
        border: Border.all(
          color: AppThemeColors.greyColor.withValues(alpha: 0.2),
        ),
      ),
      const SizedBox(height: 5),
      Text(
        text,
        style: const TextStyle(
          color: AppThemeColors.greyColor,
        ),
      ),
    ],
  );
}
