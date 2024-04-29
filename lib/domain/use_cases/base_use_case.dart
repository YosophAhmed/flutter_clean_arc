import 'package:clean_arc_project/data/network/failure.dart';
import 'package:dartz/dartz.dart';

abstract class BaseUseCase<Input, Output> {
  Future<Either<Failure, Output>> execute({
    required Input input,
  });
}
