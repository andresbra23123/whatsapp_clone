import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:whatsapp_clone/core/core.dart';
import 'package:whatsapp_clone/features/global/domain/entities/upload_file_entity.dart';
import 'package:whatsapp_clone/features/global/domain/repository/global_repository_interface.dart';

class UploadFilesUseCase
    implements
        UseCaseInterface<List<UploadFileEntity>, UploadFilesUseCaseParameters> {
  UploadFilesUseCase({required this.globalRepositoryInterface});

  final GlobalRepositoryInterface globalRepositoryInterface;

  @override
  Future<Either<Failure, List<UploadFileEntity>>> call(
    UploadFilesUseCaseParameters params,
  ) {
    return globalRepositoryInterface.uploadFiles(params.uploadFiles);
  }
}

class UploadFilesUseCaseParameters extends Equatable {
  const UploadFilesUseCaseParameters({required this.uploadFiles});

  final List<UploadFileEntity> uploadFiles;

  @override
  List<Object?> get props => [uploadFiles];
}
