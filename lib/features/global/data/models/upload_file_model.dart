// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:whatsapp_clone/features/global/domain/entities/upload_file_entity.dart';

class UploadFileModel extends UploadFileEntity {
  const UploadFileModel({
    required this.uid,
    required this.file,
    required this.fileType,
    required this.pathType,
  }) : super(
          file: file,
          fileType: fileType,
          pathType: pathType,
          uid: uid,
        );

  final String uid;
  final String file;
  final FileType fileType;
  final PathType pathType;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'file': file,
      'fileType': fileType.name,
      'pathType': pathType.name,
    };
  }

  factory UploadFileModel.fromMap(Map<String, dynamic> map) {
    return UploadFileModel(
      uid: map['uid'] as String,
      file: map['file'] as String,
      fileType: FileType.values.firstWhere(
        (e) => e.name == map['fileType'],
        orElse: () =>
            throw ArgumentError('Invalid fileType: ${map['fileType']}'),
      ),
      pathType: PathType.values.firstWhere(
        (e) => e.name == map['pathType'],
        orElse: () =>
            throw ArgumentError('Invalid pathType: ${map['pathType']}'),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory UploadFileModel.fromJson(String source) =>
      UploadFileModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

final Map<FileType, String> fileTypeExtensions = {
  FileType.image: '.webp',
  FileType.video: '.mp4',
  FileType.audio: '.mp3',
};
