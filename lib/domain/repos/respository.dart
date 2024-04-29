import 'package:clean_arc_project/domain/models/models.dart';
import 'package:dartz/dartz.dart';

import '../../data/network/failure.dart';
import '../../data/network/requests.dart';

abstract class Repository {
  Future<Either<Failure, AuthObject>> login({
    required LoginRequest loginRequest,
  });
}