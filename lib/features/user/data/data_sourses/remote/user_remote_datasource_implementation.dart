import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:whatsapp_clone/core/core.dart';
import 'package:whatsapp_clone/features/global/presentation/functions/funtions.dart';
import 'package:whatsapp_clone/features/user/data/data_sourses/remote/user_remote_datasource_interface.dart';
import 'package:whatsapp_clone/features/user/data/models/user_model.dart';
import 'package:whatsapp_clone/features/user/domain/entities/user_entity.dart';

class UserRemoteDatasourceImplementation
    implements UserRemoteDatasourceInteface {
  UserRemoteDatasourceImplementation({
    required this.fireStore,
    required this.auth,
  });

  final FirebaseFirestore fireStore;
  final FirebaseAuth auth;

  String _verificationId = '';

  @override
  Future<void> initiatePhoneNumberVerification(String phoneNumber) async {
    await auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential phoneAuthCredential) async {
        await auth.signInWithCredential(phoneAuthCredential);
      },
      codeSent: (String verificationId, int? forceResendingToken) {
        _verificationId = verificationId;
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        _verificationId = verificationId;
        customLog('time out :$verificationId');
      },
      timeout: const Duration(seconds: 120),
      verificationFailed: (FirebaseAuthException firebaseAuthException) {
        customLog(
          'phone failed : ${firebaseAuthException.message},${firebaseAuthException.code}',
        );
      },
    );
  }

  @override
  Future<void> signIn(String otp) async {
    final phoneAuthCredential = PhoneAuthProvider.credential(
      verificationId: _verificationId,
      smsCode: otp,
    );
    await auth.signInWithCredential(phoneAuthCredential);
  }

  @override
  Future<void> signOut() async {
    await auth.signOut();
  }

  @override
  Future<UserModel> getCurrentUser() async {
    final currentUser = auth.currentUser;

    if (currentUser == null) {
      throw ServerException(message: 'No authenticated user found');
    }

    try {
      final userDocument = await fireStore
          .collection(FirebaseCollectionConst.users)
          .doc(currentUser.uid)
          .get();
      if (userDocument.exists && userDocument.data() != null) {
        return UserModel.fromMap(userDocument.data()!);
      } else {
        return UserModel.fromFirebaseUserAuth(currentUser);
      }
    } on FirebaseException catch (e) {
      throw ServerException(
        message: 'Firebase error: ${e.message}',
      );
    } on ServerException catch (e) {
      throw ServerException(
        message: 'Unexpected error: $e',
      );
    }
  }

  @override
  Future<void> createOrUpdateUser(UserEntity userModel) async {
    try {
      final userCollection =
          fireStore.collection(FirebaseCollectionConst.users);
      final userDoc = userCollection.doc(userModel.uid);
      final userDocSnap = await userDoc.get();

      if (!userDocSnap.exists) {
        await userDoc.set(userModel.toMap());
      } else {
        await userDoc.update(userModel.toMap());
      }
    } catch (e) {
      throw ServerException(
        message: e.toString(),
      );
    }
  }

  @override
  Future<String> getCurrenUid() async {
    final currentUser = auth.currentUser;
    if (currentUser != null) {
      return currentUser.uid;
    } else {
      throw ServerException(message: 'No authenticated user found');
    }
  }
}
