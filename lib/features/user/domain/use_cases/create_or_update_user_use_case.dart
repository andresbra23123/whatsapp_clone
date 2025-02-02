import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:whatsapp_clone/core/core.dart';
import 'package:whatsapp_clone/features/user/domain/entities/user_entity.dart';
import 'package:whatsapp_clone/features/user/domain/repository/user_repository_interface.dart';

class CreateOrUpdateUserUseCase
    implements UseCaseInterface<void, CreateOrUpdateUserUseCaseParameters> {
  CreateOrUpdateUserUseCase({required this.userRepositoryInterface});

  final UserRepositoryInterface userRepositoryInterface;
  @override
  Future<Either<Failure, void>> call(
    CreateOrUpdateUserUseCaseParameters params,
  ) {
    return userRepositoryInterface.createOrUpdateUser(params.userEntity);
  }
}

class CreateOrUpdateUserUseCaseParameters extends Equatable {
  const CreateOrUpdateUserUseCaseParameters({required this.userEntity});

  final UserEntity userEntity;

  @override
  List<Object?> get props => [userEntity];
}
