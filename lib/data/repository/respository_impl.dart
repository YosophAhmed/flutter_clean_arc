import 'package:clean_arc_project/data/data_source/remote_data_source.dart';
import 'package:clean_arc_project/data/mapper/mapper.dart';
import 'package:clean_arc_project/data/network/error_handler.dart';
import 'package:clean_arc_project/data/network/failure.dart';
import 'package:clean_arc_project/data/network/network_info.dart';

import 'package:clean_arc_project/data/network/requests.dart';

import 'package:clean_arc_project/domain/models/models.dart';

import 'package:dartz/dartz.dart';

import '../../domain/repos/respository.dart';

class RepositoryImpl implements Repository {
  RepositoryImpl(
    this._remoteDataSource,
    this._networkInfo,
  );

  final RemoteDataSource _remoteDataSource;
  final NetworkInfo _networkInfo;

  @override
  Future<Either<Failure, AuthObject>> login(
      {required LoginRequest loginRequest}) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSource.login(
          loginRequest: loginRequest,
        );
        if (response.status == ApiInternalStatus.success) {
          return Right(
            response.toDomain(),
          );
        } else {
          return Left(
            Failure(
              ApiInternalStatus.failure,
              response.message ?? ResponseMessage.typeDefault,
            ),
          );
        }
      } catch (error) {
        return Left(
          ErrorHandler.handle(error).failure,
        );
      }
    } else {
      return Left(
        DataSource.noInternetConnection.getFailure(),
      );
    }
  }
}
