import 'package:get_it/get_it.dart';
import 'package:test_task_project/application/markets/data/datasources/markets_remote_data_source.dart';
import 'package:test_task_project/application/markets/data/repositories/markets_repository_impl.dart';
import 'package:test_task_project/application/markets/domain/repositories/markets_repository.dart';
import 'package:test_task_project/application/markets/domain/usecases/get_markets.dart';
import 'package:test_task_project/application/markets/presentation/bloc/markets_bloc.dart';

final dependencyService = GetIt.instance;

void initializeDependencies() {
  initLogics();
  initUseCases();
  initRepositories();
  initDataSources();
}

void initLogics() {
  dependencyService.registerFactory(() => MarketsBloc(dependencyService()));
}

void initUseCases() {
  dependencyService.registerLazySingleton(
    () => GetMarkets(dependencyService()),
  );
}

void initRepositories() {
  dependencyService.registerLazySingleton<MarketsRepository>(
    () => MarketsRepositoryImpl(dependencyService()),
  );
}

void initDataSources() {
  dependencyService.registerLazySingleton<MarketsRemoteDataSource>(
    () => MarketsRemoteDataSourceImpl(),
  );
}
