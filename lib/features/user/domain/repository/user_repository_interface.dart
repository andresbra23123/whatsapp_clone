import 'package:dartz/dartz.dart';
import 'package:whatsapp_clone/core/config/error/failures.dart';
import 'package:whatsapp_clone/features/user/domain/entities/user_entity.dart';

abstract class UserRepositoryInterface {
  Future<Either<Failure, void>> initiatePhoneNumberVerification(
    String phoneNumber,
  );
  Future<Either<Failure, void>> signIn(String otp);
  Future<Either<Failure, void>> signOut();
  Future<Either<Failure, UserEntity>> getCurrentUser();

  Future<Either<Failure, void>> createOrUpdateUser(UserEntity user);
}
