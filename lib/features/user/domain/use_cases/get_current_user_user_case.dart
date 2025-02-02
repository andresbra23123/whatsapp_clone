import 'package:dartz/dartz.dart';
import 'package:whatsapp_clone/core/core.dart';
import 'package:whatsapp_clone/features/user/domain/entities/user_entity.dart';
import 'package:whatsapp_clone/features/user/domain/repository/user_repository_interface.dart';

class GetCurrentUserUserCase implements UseCaseInterface<UserEntity, NoParams> {
  GetCurrentUserUserCase({required this.userRepositoryInterface});

  final UserRepositoryInterface userRepositoryInterface;

  @override
  Future<Either<Failure, UserEntity>> call(NoParams params) {
    return userRepositoryInterface.getCurrentUser();
  }
}
