import 'package:go_router/go_router.dart';
import 'package:whatsapp_clone/core/core.dart';
import 'package:whatsapp_clone/dependency_injection.dart';
import 'package:whatsapp_clone/features/user/data/data_sourses/remote/user_remote_datasource_implementation.dart';
import 'package:whatsapp_clone/features/user/data/data_sourses/remote/user_remote_datasource_interface.dart';
import 'package:whatsapp_clone/features/user/data/repository/user_repository_implementation.dart';
import 'package:whatsapp_clone/features/user/domain/repository/user_repository_interface.dart';
import 'package:whatsapp_clone/features/user/domain/use_cases/create_or_update_user_use_case.dart';
import 'package:whatsapp_clone/features/user/domain/use_cases/get_current_user_user_case.dart';
import 'package:whatsapp_clone/features/user/domain/use_cases/initiate_phone_number_verification_use_case.dart';
import 'package:whatsapp_clone/features/user/domain/use_cases/sign_in_use_case.dart';
import 'package:whatsapp_clone/features/user/domain/use_cases/sign_out_use_case.dart';
import 'package:whatsapp_clone/features/user/presentation/cubits/user_auth/user_auth_cubit.dart';
import 'package:whatsapp_clone/features/user/presentation/cubits/user_managemen/user_management_cubit.dart';

Future<void> userDependencyInjection() async {
  // ------------------------ providers ------------------------
  sl
    ..registerLazySingleton<UserAuthCubit>(
      () => UserAuthCubit(
        initiatePhoneNumberVerificationUseCase: sl(),
        signInUseCase: sl(),
        signOutUseCase: sl(),
        getCurrentUserUserCase: sl(),
      ),
    )
    ..registerLazySingleton<UserManagementCubit>(
      () => UserManagementCubit(createOrUpdateUserUseCase: sl()),
    )

    // ------------------------ use cases ------------------------

    ..registerLazySingleton<InitiatePhoneNumberVerificationUseCase>(
      () =>
          InitiatePhoneNumberVerificationUseCase(userRepositoryInterface: sl()),
    )
    ..registerLazySingleton<SignInUseCase>(
      () => SignInUseCase(userRepositoryInterface: sl()),
    )
    ..registerLazySingleton<SignOutUseCase>(
      () => SignOutUseCase(userRepositoryInterface: sl()),
    )
    ..registerLazySingleton<GetCurrentUserUserCase>(
      () => GetCurrentUserUserCase(userRepositoryInterface: sl()),
    )
    ..registerLazySingleton<CreateOrUpdateUserUseCase>(
      () => CreateOrUpdateUserUseCase(userRepositoryInterface: sl()),
    )

    // ------------------------ repositories ------------------------
    ..registerLazySingleton<UserRepositoryInterface>(
      () => UserRepositoryImplementation(userRemoteDatasourceInterface: sl()),
    )

    // ------------------------ datasources ------------------------
    ..registerLazySingleton<UserRemoteDatasourceInteface>(
      () => UserRemoteDatasourceImplementation(fireStore: sl(), auth: sl()),
    )

    // ------------------------ external ------------------------
    ..registerLazySingleton<GoRouter>(() => appRouter);
}
