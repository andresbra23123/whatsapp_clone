import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:whatsapp_clone/core/config/error/error.dart';
import 'package:whatsapp_clone/features/global/domain/entities/upload_file_entity.dart';
import 'package:whatsapp_clone/features/global/domain/use_cases/upload_files_use_case.dart';
import 'package:whatsapp_clone/features/global/presentation/functions/either_handle_result.dart';

class StorageCubit extends Cubit<void> {
  StorageCubit({required this.uploadFilesUseCase}) : super(null);

  final UploadFilesUseCase uploadFilesUseCase;

  Future<Either<Failure, UploadFileEntity>> uploadProfilePhotoUrl({
    required List<UploadFileEntity> uploadFiles,
  }) async {
    final result = await uploadFilesUseCase(
      UploadFilesUseCaseParameters(uploadFiles: uploadFiles),
    );
    return eitherHandleResult(
      result: result,
      onFailure: Left.new,
      onSuccess: (files) => Right(files.first),
    );
  }
}
