part of 'user_auth_cubit.dart';

sealed class UserAuthState extends Equatable {
  const UserAuthState();

  @override
  List<Object> get props => [];
}

final class UserAuthInitial extends UserAuthState {}

final class UserAuthLoading extends UserAuthState {}

final class UserAuthAuthenticated extends UserAuthState {
  const UserAuthAuthenticated(this.user);
  final UserEntity user;

  @override
  List<Object> get props => [user];
}

final class UserAuthUnauthenticated extends UserAuthState {}

final class UserAuthVerifyPhoneNumber extends UserAuthState {}

final class UserAuthFailure extends UserAuthState {
  const UserAuthFailure(this.message);
  final String message;

  @override
  List<Object> get props => [message];
}
