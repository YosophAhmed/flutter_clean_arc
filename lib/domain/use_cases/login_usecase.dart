import 'package:clean_arc_project/data/network/failure.dart';
import 'package:clean_arc_project/data/network/requests.dart';
import 'package:clean_arc_project/domain/models/models.dart';
import 'package:clean_arc_project/domain/repos/respository.dart';
import 'package:clean_arc_project/domain/use_cases/base_use_case.dart';
import 'package:dartz/dartz.dart';

class LoginUseCase implements BaseUseCase<LoginUseCaseInput, AuthObject> {
  LoginUseCase(
    this._repository,
  );

  final Repository _repository;

  @override
  Future<Either<Failure, AuthObject>> execute({
    required input,
  }) async {
    return await _repository.login(
      loginRequest: LoginRequest(
        input.email,
        input.password,
      ),
    );
  }
}

class LoginUseCaseInput {
  LoginUseCaseInput(
    this.email,
    this.password,
  );
  String email;
  String password;
}
