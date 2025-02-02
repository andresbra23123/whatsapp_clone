import 'package:whatsapp_clone/features/user/data/models/user_model.dart';
import 'package:whatsapp_clone/features/user/domain/entities/user_entity.dart';

abstract class UserRemoteDatasourceInteface {
  Future<void> initiatePhoneNumberVerification(String phoneNumber);
  Future<void> signIn(String otp);
  Future<void> signOut();
  Future<UserModel> getCurrentUser();
  Future<void> createOrUpdateUser(UserEntity userModel);
  Future<String> getCurrenUid();
}
