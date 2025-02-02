import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';
import 'package:whatsapp_clone/core/config/error/error.dart';
import 'package:whatsapp_clone/features/global/data/data_sources/remote/global_remote_data_source_interface.dart';
import 'package:whatsapp_clone/features/global/data/models/upload_file_model.dart';
import 'package:whatsapp_clone/features/global/domain/entities/upload_file_entity.dart';

class GlobalRemoteDataSourceImplementation
    implements GlobalRemoteDataSourceInterface {
  GlobalRemoteDataSourceImplementation({
    required this.firebaseStorage,
    required this.uuid,
  }) : _firebaseStorageReference = firebaseStorage.ref();

  final FirebaseStorage firebaseStorage;
  final Uuid uuid;

  final Reference _firebaseStorageReference;

  @override
  Future<List<UploadFileModel>> uploadFiles(
    List<UploadFileEntity> files,
  ) async {
    try {
      final futures = files.map((file) async {
        final uid = file.uid;
        final pathType = file.pathType.name;
        final uuids = uuid.v1();
        final date = DateTime.now().millisecondsSinceEpoch;
        final format = getFileExtension(file.fileType);
        final path = '$uid/$pathType/$uuids-$date.$format';
        final newFile = File(file.file);

        final reference = _firebaseStorageReference.child(path);
        final uploadTask = reference.putFile(newFile);
        final taskSnapshot = await uploadTask;
        final fileUrl = await taskSnapshot.ref.getDownloadURL();

        return UploadFileModel(
          uid: uid,
          file: fileUrl,
          fileType: file.fileType,
          pathType: file.pathType,
        );
      }).toList();

      return await Future.wait(futures);
    } on FirebaseException catch (e) {
      throw ServerException(
        message: 'Firebase error: ${e.message}',
      );
    } catch (e) {
      throw ServerException(
        message: 'Unexpected error: $e',
      );
    }
  }

  @override
  String getFileExtension(FileType fileType) {
    return fileTypeExtensions[fileType] ?? '.unknown';
  }
}
