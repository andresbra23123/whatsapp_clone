// ignore_for_file: public_member_api_docs
// ignore_for_file: sort_constructors_first

import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:whatsapp_clone/features/user/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    this.uid,
    this.phoneNumber,
    this.displayName,
    this.email,
    this.creationTime,
    this.lastSignInTime,
    this.photoUrl,
    this.bout,
  }) : super(
          uid: uid,
          phoneNumber: phoneNumber,
          bout: bout,
          displayName: displayName,
          email: email,
          creationTime: creationTime,
          lastSignInTime: lastSignInTime,
          photoUrl: photoUrl,
        );

  final String? displayName;
  final String? email;
  final DateTime? creationTime;
  final DateTime? lastSignInTime;
  final String? phoneNumber;
  final String? photoUrl;
  final String? uid;
  final String? bout;

  factory UserModel.fromFirebaseUserAuth(User user) {
    return UserModel(
      uid: user.uid,
      displayName: user.displayName,
      email: user.email,
      phoneNumber: user.phoneNumber,
      photoUrl: user.photoURL,
      creationTime: user.metadata.creationTime,
      lastSignInTime: user.metadata.lastSignInTime,
    );
  }

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

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      displayName:
          map['displayName'] != null ? map['displayName'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      creationTime: map['creationTime'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['creationTime'] as int)
          : null,
      lastSignInTime: map['lastSignInTime'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['lastSignInTime'] as int)
          : null,
      phoneNumber:
          map['phoneNumber'] != null ? map['phoneNumber'] as String : null,
      photoUrl: map['photoUrl'] != null ? map['photoUrl'] as String : null,
      uid: map['uid'] != null ? map['uid'] as String : null,
      bout: map['bout'] != null ? map['bout'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
