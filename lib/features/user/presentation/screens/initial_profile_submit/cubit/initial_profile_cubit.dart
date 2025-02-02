import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:whatsapp_clone/features/user/domain/entities/user_entity.dart';

part 'initial_profile_state.dart';

class InitialProfileCubit extends Cubit<InitialProfileState> {
  InitialProfileCubit({required this.userEntity})
      : super(
          InitialProfileState(userEntity: userEntity),
        );

  final UserEntity userEntity;

  // void updateDisplayName(String newDisplayName) {
  //   final updatedUserEntity = state.userEntity.copyWith(
  //     displayName: newDisplayName,
  //   );
  //   emit(state.copyWith(userEntity: updatedUserEntity));
  // }

  // void updateDisplayP(String photoUrl) {
  //   final updatedUserEntity = state.userEntity.copyWith(
  //     photoUrl: photoUrl,
  //   );
  //   emit(state.copyWith(userEntity: updatedUserEntity));
  // }
}
