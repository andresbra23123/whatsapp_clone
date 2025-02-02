import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:whatsapp_clone/features/global/global_dependency_injection.dart';
import 'package:whatsapp_clone/features/user/user_dependency_injection.dart';

final sl = GetIt.instance;

Future<void> dependencyInjectionInit() async {
  final firebaseAuth = FirebaseAuth.instance;
  final firebaseFirestore = FirebaseFirestore.instance;
  final firebaseStorage = FirebaseStorage.instance.ref();

  sl
    ..registerLazySingleton(() => firebaseAuth)
    ..registerLazySingleton(() => firebaseFirestore)
    ..registerLazySingleton(() => firebaseStorage);

  await userDependencyInjection();
  await globalDependencyInjection();
}
