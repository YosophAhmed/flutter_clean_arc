import 'package:clean_arc_project/data/network/app_api.dart';
import 'package:clean_arc_project/data/network/requests.dart';

import '../response/responses.dart';

abstract class RemoteDataSource {
  Future<AuthResponse> login({
    required LoginRequest loginRequest,
  });
}

class RemoteDataSourceImpl extends RemoteDataSource {
  RemoteDataSourceImpl(
    this._appServiceClient,
  );

  final AppServiceClient _appServiceClient;

  @override
  Future<AuthResponse> login({
    required LoginRequest loginRequest,
  }) async {
    return await _appServiceClient.login(
      loginRequest.email,
      loginRequest.password,
    );
  }
}
