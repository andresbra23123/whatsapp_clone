import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:whatsapp_clone/core/core.dart';
import 'package:whatsapp_clone/features/global/presentation/functions/either_handle_result.dart';
import 'package:whatsapp_clone/features/user/domain/entities/user_entity.dart';
import 'package:whatsapp_clone/features/user/domain/use_cases/get_current_user_user_case.dart';
import 'package:whatsapp_clone/features/user/domain/use_cases/initiate_phone_number_verification_use_case.dart';
import 'package:whatsapp_clone/features/user/domain/use_cases/sign_in_use_case.dart';
import 'package:whatsapp_clone/features/user/domain/use_cases/sign_out_use_case.dart';

part 'user_auth_state.dart';

class UserAuthCubit extends Cubit<UserAuthState> {
  UserAuthCubit({
    required this.initiatePhoneNumberVerificationUseCase,
    required this.signInUseCase,
    required this.signOutUseCase,
    required this.getCurrentUserUserCase,
  }) : super(UserAuthInitial());

  final InitiatePhoneNumberVerificationUseCase
      initiatePhoneNumberVerificationUseCase;
  final SignInUseCase signInUseCase;
  final SignOutUseCase signOutUseCase;
  final GetCurrentUserUserCase getCurrentUserUserCase;

  Future<void> initiatePhoneNumberVerification({
    required String phoneNumber,
  }) async {
    final result = await initiatePhoneNumberVerificationUseCase(
      VerifyPhoneNumberUseCaseParameters(phoneNumber: phoneNumber),
    );
    await eitherHandleResult(
      result: result,
      onFailure: (failure) =>
          emit(UserAuthFailure((failure as ServerFailure).message)),
      onSuccess: (value) => emit(UserAuthVerifyPhoneNumber()),
    );
  }

  Future<void> validateOtpAndSignIn({
    required String otp,
  }) async {
    final result = await signInUseCase(
      SignInUseCaseParameters(otp: otp),
    );

    await eitherHandleResult(
      result: result,
      onFailure: (failure) =>
          emit(UserAuthFailure((failure as ServerFailure).message)),
      onSuccess: (user) => getCurrentUser(),
    );
  }

  Future<void> getCurrentUser() async {
    final result = await getCurrentUserUserCase(NoParams());

    await eitherHandleResult(
      result: result,
      onFailure: (failure) => emit(UserAuthUnauthenticated()),
      onSuccess: (user) => emit(
        UserAuthAuthenticated(user),
      ),
    );
  }

  Future<void> signOut() async {
    final result = await signOutUseCase(NoParams());

    await eitherHandleResult(
      result: result,
      onFailure: (failure) =>
          emit(UserAuthFailure((failure as ServerFailure).message)),
      onSuccess: (value) => emit(UserAuthUnauthenticated()),
    );
  }
}
