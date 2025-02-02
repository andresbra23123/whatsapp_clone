import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:whatsapp_clone/core/core.dart';
import 'package:whatsapp_clone/features/user/domain/repository/user_repository_interface.dart';

class InitiatePhoneNumberVerificationUseCase
    implements UseCaseInterface<void, VerifyPhoneNumberUseCaseParameters> {
  InitiatePhoneNumberVerificationUseCase({
    required this.userRepositoryInterface,
  });

  final UserRepositoryInterface userRepositoryInterface;

  @override
  Future<Either<Failure, void>> call(
    VerifyPhoneNumberUseCaseParameters params,
  ) {
    return userRepositoryInterface
        .initiatePhoneNumberVerification(params.phoneNumber);
  }
}

class VerifyPhoneNumberUseCaseParameters extends Equatable {
  const VerifyPhoneNumberUseCaseParameters({required this.phoneNumber});

  final String phoneNumber;

  @override
  List<Object?> get props => [phoneNumber];
}
