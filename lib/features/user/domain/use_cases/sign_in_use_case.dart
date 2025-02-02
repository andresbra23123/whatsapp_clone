import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:whatsapp_clone/core/core.dart';
import 'package:whatsapp_clone/features/user/domain/repository/user_repository_interface.dart';

class SignInUseCase implements UseCaseInterface<void, SignInUseCaseParameters> {
  SignInUseCase({required this.userRepositoryInterface});

  final UserRepositoryInterface userRepositoryInterface;

  @override
  Future<Either<Failure, void>> call(SignInUseCaseParameters params) {
    return userRepositoryInterface.signIn(params.otp);
  }
}

class SignInUseCaseParameters extends Equatable {
  const SignInUseCaseParameters({required this.otp});
  final String otp;

  @override
  List<Object?> get props => [otp];
}
