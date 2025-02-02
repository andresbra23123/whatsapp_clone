// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  const UserEntity({
    this.uid,
    this.phoneNumber,
    this.displayName,
    this.email,
    this.creationTime,
    this.lastSignInTime,
    this.photoUrl,
    this.bout,
  });

  final String? displayName;
  final String? email;
  final DateTime? creationTime;
  final DateTime? lastSignInTime;
  final String? phoneNumber;
  final String? photoUrl;
  final String? uid;
  final String? bout;

  @override
  List<Object?> get props => [
        uid,
        phoneNumber,
        displayName,
        email,
        creationTime,
        lastSignInTime,
        photoUrl,
        bout,
      ];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'displayName': displayName,
      'email': email,
      'creationTime': creationTime?.millisecondsSinceEpoch,
      'lastSignInTime': lastSignInTime?.millisecondsSinceEpoch,
      'phoneNumber': phoneNumber,
      'photoUrl': photoUrl,
      'uid': uid,
      'bout': bout,
    };
  }

  @override
  String toString() {
    return 'UserEntity(uid: $uid, phoneNumber: $phoneNumber, displayName: $displayName, email: $email, creationTime: $creationTime, lastSignInTime: $lastSignInTime, photoUrl: $photoUrl, bout: $bout)';
  }

  UserEntity copyWith({
    String? displayName,
    String? email,
    DateTime? creationTime,
    DateTime? lastSignInTime,
    String? phoneNumber,
    String? photoUrl,
    String? uid,
    String? bout,
  }) {
    return UserEntity(
      displayName: displayName ?? this.displayName,
      email: email ?? this.email,
      creationTime: creationTime ?? this.creationTime,
      lastSignInTime: lastSignInTime ?? this.lastSignInTime,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      photoUrl: photoUrl ?? this.photoUrl,
      uid: uid ?? this.uid,
      bout: bout ?? this.bout,
    );
  }
}
