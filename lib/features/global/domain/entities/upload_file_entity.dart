import 'package:equatable/equatable.dart';

enum PathType {
  profile,
  status,
  message
  // Se pueden agregar más tipos en el futuro
}

enum FileType {
  image,
  video,
  audio
  // Podrías considerar incluir otros tipos como "document" o "other".
}

class UploadFileEntity extends Equatable {
  const UploadFileEntity({
    required this.uid,
    required this.file,
    required this.fileType,
    required this.pathType,
  });

  final String uid;
  final String file;
  final FileType fileType;
  final PathType pathType;

  @override
  List<Object?> get props => [uid, file, fileType, pathType];
}
