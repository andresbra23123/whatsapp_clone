import 'package:whatsapp_clone/features/global/data/models/upload_file_model.dart';
import 'package:whatsapp_clone/features/global/domain/entities/upload_file_entity.dart';

abstract class GlobalRemoteDataSourceInterface {
  Future<List<UploadFileModel>> uploadFiles(List<UploadFileEntity> files);
  String getFileExtension(FileType fileType);
}
