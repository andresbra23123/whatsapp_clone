import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:whatsapp_clone/core/config/error/error.dart';
import 'package:whatsapp_clone/features/global/presentation/functions/either_handle_result.dart';
import 'package:whatsapp_clone/features/user/domain/entities/user_entity.dart';
import 'package:whatsapp_clone/features/user/domain/use_cases/create_or_update_user_use_case.dart';

part 'user_management_state.dart';

class UserManagementCubit extends Cubit<UserManagementState> {
  UserManagementCubit({required this.createOrUpdateUserUseCase})
      : super(UserManagementInitial());

  final CreateOrUpdateUserUseCase createOrUpdateUserUseCase;

  Future<void> createOrUpdateUser(UserEntity userEntity) async {
    {
      final result = await createOrUpdateUserUseCase(
        CreateOrUpdateUserUseCaseParameters(userEntity: userEntity),
      );
      await eitherHandleResult(
        result: result,
        onFailure: (failure) =>
            emit(UserManagementFailure((failure as ServerFailure).message)),
        onSuccess: (value) => emit(UserManagementCreateOrUpdateSuccess()),
      );
    }
  }
}
