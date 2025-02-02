import 'package:dartz/dartz.dart';
import 'package:whatsapp_clone/core/core.dart';
import 'package:whatsapp_clone/features/global/data/data_sources/remote/global_remote_data_source_interface.dart';
import 'package:whatsapp_clone/features/global/domain/entities/upload_file_entity.dart';
import 'package:whatsapp_clone/features/global/domain/repository/global_repository_interface.dart';
import 'package:whatsapp_clone/features/global/presentation/functions/funtions.dart';

class GlobalRepositoryImplementation implements GlobalRepositoryInterface {
  GlobalRepositoryImplementation(
      {required this.globalRemoteDataSourceInterface});

  final GlobalRemoteDataSourceInterface globalRemoteDataSourceInterface;

  @override
  Future<Either<Failure, List<UploadFileEntity>>> uploadFiles(
    List<UploadFileEntity> files,
  ) async {
    try {
      final uploadFiles =
          await globalRemoteDataSourceInterface.uploadFiles(files);
      return Right(uploadFiles);
    } on ServerException catch (e) {
      customLog('uploadFiles: ${e.message}');
      return Left(ServerFailure(message: e.message));
    }
  }
}
