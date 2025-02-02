import 'package:dartz/dartz.dart';

Future<T> eitherHandleResult<L, R, T>({
  required Either<L, R> result,
  required T Function(L) onFailure,
  required T Function(R) onSuccess,
}) async =>
    result.fold(onFailure, onSuccess);
