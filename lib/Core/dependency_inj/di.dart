import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:sarmad_task/Features/user_search/Data/Datasource/data_source.dart';
import 'package:sarmad_task/Features/user_search/Data/Repository/repo.dart';
import 'package:sarmad_task/Features/user_search/Presentation/cubit/search_cubit.dart';

import '../Network/connection_checker.dart';

final GetIt getIt = GetIt.instance;
Future<void> setupDependencies() async {
  //Cubit
  getIt.registerLazySingleton(() => SearchCubit(searchRepository: getIt()));
  //DataSource
  getIt.registerLazySingleton(() => SearchDatasource());
  //Repository
  getIt.registerLazySingleton(() =>
      SearchRepository(searchDatasource: getIt(), connectionChecker: getIt()));

  //Externals!
  getIt.registerLazySingleton<ConnectionChecker>(
      () => ConnectionChecker(getIt()));

  getIt.registerLazySingleton(() => InternetConnectionChecker());
}
