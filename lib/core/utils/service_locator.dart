import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:school_ai/core/utils/network/api_services.dart';
import 'package:school_ai/data/repositories/auth_repo/login_repo_impl.dart';
import 'package:school_ai/data/repositories/hive_repo/hive_repo.dart';
import 'package:school_ai/data/repositories/hive_repo/hive_repo_impl.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<ApiServices>(
    ApiServices(
      Dio(),
    ),
  );
  getIt.registerLazySingleton<HiveRepo>(
    () => HiveRepoImpl(),
  );
  getIt.registerSingleton<LoginRepoImpl>(
    LoginRepoImpl(
      getIt.get<ApiServices>(),
    ),
  );
}
