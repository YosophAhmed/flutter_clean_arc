import 'package:clean_arc_project/app/app_prefs.dart';
import 'package:clean_arc_project/data/data_source/remote_data_source.dart';
import 'package:clean_arc_project/data/network/app_api.dart';
import 'package:clean_arc_project/data/network/dio_factory.dart';
import 'package:clean_arc_project/data/network/network_info.dart';
import 'package:clean_arc_project/data/repository/respository_impl.dart';
import 'package:clean_arc_project/domain/repos/respository.dart';
import 'package:clean_arc_project/domain/use_cases/login_usecase.dart';
import 'package:clean_arc_project/presentation/login/view_model/login_view_model.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

final instance = GetIt.asNewInstance();

Future<void> initAppModule() async {
  // shared prefs instance
  final sharedPrefs = await SharedPreferences.getInstance();
  instance.registerLazySingleton<SharedPreferences>(
    () => sharedPrefs,
  );

  // app prefs instance
  instance.registerLazySingleton<AppPrefs>(
    () => AppPrefs(
      instance<SharedPreferences>(),
    ),
  );

  // network info instance
  instance.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(
      InternetConnectionChecker(),
    ),
  );

  // Dio factory instance
  instance.registerLazySingleton(
    () => DioFactory(
      instance<AppPrefs>(),
    ),
  );

  // app service client instance
  Dio dio = await instance<DioFactory>().getDio();
  instance.registerLazySingleton<AppServiceClient>(
    () => AppServiceClient(dio),
  );

  // Remote dara source
  instance.registerLazySingleton<RemoteDataSource>(
    () => RemoteDataSourceImpl(
      instance<AppServiceClient>(),
    ),
  );

  // repository instance
  instance.registerLazySingleton<Repository>(
    () => RepositoryImpl(
      instance<RemoteDataSourceImpl>(),
      instance<NetworkInfoImpl>(),
    ),
  );
}

void initLoginModule() {
  if (!GetIt.I.isRegistered<LoginUseCase>()) {
    instance.registerFactory<LoginUseCase>(
      () => LoginUseCase(
        instance<Repository>(),
      ),
    );
    instance.registerFactory<LoginViewModel>(
      () => LoginViewModel(
        instance<LoginUseCase>(),
      ),
    );
  }
}
