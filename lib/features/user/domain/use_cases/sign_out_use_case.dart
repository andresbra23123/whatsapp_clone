import 'package:dartz/dartz.dart';
import 'package:whatsapp_clone/core/core.dart';
import 'package:whatsapp_clone/features/user/domain/repository/user_repository_interface.dart';

class SignOutUseCase implements UseCaseInterface<void, NoParams> {
  SignOutUseCase({required this.userRepositoryInterface});

  final UserRepositoryInterface userRepositoryInterface;

  @override
  Future<Either<Failure, void>> call(NoParams params) {
    return userRepositoryInterface.signOut();
  }
}
