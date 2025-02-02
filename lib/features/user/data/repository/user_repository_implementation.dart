import 'package:dartz/dartz.dart';
import 'package:whatsapp_clone/core/core.dart';
import 'package:whatsapp_clone/features/global/presentation/functions/funtions.dart';
import 'package:whatsapp_clone/features/user/data/data_sourses/remote/user_remote_datasource_interface.dart';
import 'package:whatsapp_clone/features/user/domain/entities/user_entity.dart';
import 'package:whatsapp_clone/features/user/domain/repository/user_repository_interface.dart';

class UserRepositoryImplementation implements UserRepositoryInterface {
  UserRepositoryImplementation({required this.userRemoteDatasourceInterface});

  final UserRemoteDatasourceInteface userRemoteDatasourceInterface;

  @override
  Future<Either<Failure, void>> initiatePhoneNumberVerification(
    String phoneNumber,
  ) async {
    try {
      await userRemoteDatasourceInterface
          .initiatePhoneNumberVerification(phoneNumber);
      return const Right(null);
    } catch (e) {
      customLog('initiatePhoneNumberVerification: $e');
      return Left(
        ServerFailure(
          message: e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, void>> signIn(String otp) async {
    try {
      await userRemoteDatasourceInterface.signIn(otp);
      return const Right(null);
    } catch (e) {
      customLog('signIn: $e');
      return Left(
        ServerFailure(
          message: e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, void>> signOut() async {
    try {
      await userRemoteDatasourceInterface.signOut();
      return const Right(null);
    } catch (e) {
      customLog('signOutError: $e');
      return Left(
        ServerFailure(
          message: e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, UserEntity>> getCurrentUser() async {
    try {
      final user = await userRemoteDatasourceInterface.getCurrentUser();
      return Right(user);
    } on ServerException catch (e) {
      customLog('getCurrentUser: ${e.message}');

      return Left(ServerFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, void>> createOrUpdateUser(UserEntity user) async {
    try {
      await userRemoteDatasourceInterface.createOrUpdateUser(user);
      return const Right(null);
    } on ServerException catch (e) {
      customLog('createOrUpdateUser: ${e.message}');

      return Left(ServerFailure(message: e.message));
    }
  }
}
