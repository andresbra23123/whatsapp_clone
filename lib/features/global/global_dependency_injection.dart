import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';
import 'package:whatsapp_clone/dependency_injection.dart';
import 'package:whatsapp_clone/features/global/data/data_sources/remote/global_remote_data_source_implementation.dart';
import 'package:whatsapp_clone/features/global/data/data_sources/remote/global_remote_data_source_interface.dart';
import 'package:whatsapp_clone/features/global/data/repository/global_repository_implementation.dart';
import 'package:whatsapp_clone/features/global/domain/repository/global_repository_interface.dart';
import 'package:whatsapp_clone/features/global/domain/use_cases/upload_files_use_case.dart';
import 'package:whatsapp_clone/features/global/presentation/cubit/cubits.dart';

Future<void> globalDependencyInjection() async {
  // ------------------------ providers ------------------------
  sl
    ..registerLazySingleton<StorageCubit>(
      () => StorageCubit(uploadFilesUseCase: sl()),
    )
    ..registerLazySingleton<PreferencesCubit>(
      () => PreferencesCubit(sharedPreferences: sl()),
    )

    // ------------------------ use cases ------------------------

    ..registerLazySingleton<UploadFilesUseCase>(
      () => UploadFilesUseCase(globalRepositoryInterface: sl()),
    )

    // ------------------------ repositories ------------------------
    ..registerLazySingleton<GlobalRepositoryInterface>(
      () =>
          GlobalRepositoryImplementation(globalRemoteDataSourceInterface: sl()),
    )

    // ------------------------ datasources ------------------------
    ..registerLazySingleton<GlobalRemoteDataSourceInterface>(
      () => GlobalRemoteDataSourceImplementation(
          firebaseStorage: sl(), uuid: sl()),
    );

  // ------------------------ external ------------------------

  final prefs = await SharedPreferences.getInstance();
  final uuid = Uuid();

  sl
    ..registerLazySingleton(() => prefs)
    ..registerLazySingleton(() => uuid);
}
