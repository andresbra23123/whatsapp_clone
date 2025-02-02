// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'initial_profile_cubit.dart';

class InitialProfileState extends Equatable {
  const InitialProfileState({required this.userEntity});

  final UserEntity userEntity;

  @override
  List<Object?> get props => [userEntity];

  InitialProfileState copyWith({
    UserEntity? userEntity,
  }) {
    return InitialProfileState(
      userEntity: userEntity ?? this.userEntity,
    );
  }
}
