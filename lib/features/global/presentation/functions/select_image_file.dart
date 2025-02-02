import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

Future<File?> selectImageFile(BuildContext context) async {
  final file = await context.pushNamed('imagePickerScreen') as File?;
  return file;
}
