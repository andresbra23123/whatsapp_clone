import 'package:dartz/dartz.dart';
import 'package:whatsapp_clone/core/core.dart';
import 'package:whatsapp_clone/features/global/domain/entities/upload_file_entity.dart';

abstract class GlobalRepositoryInterface {
  Future<Either<Failure, List<UploadFileEntity>>> uploadFiles(
    List<UploadFileEntity> files,
  );
}
