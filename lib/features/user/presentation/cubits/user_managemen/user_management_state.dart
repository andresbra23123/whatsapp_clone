part of 'user_management_cubit.dart';

sealed class UserManagementState extends Equatable {
  const UserManagementState();

  @override
  List<Object> get props => [];
}

final class UserManagementInitial extends UserManagementState {}

final class UserManagementCreateOrUpdateSuccess extends UserManagementState {}

final class UserManagementFailure extends UserManagementState {
  const UserManagementFailure(this.message);
  final String message;

  @override
  List<Object> get props => [message];
}
