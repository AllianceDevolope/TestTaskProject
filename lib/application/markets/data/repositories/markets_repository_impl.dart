import 'package:dartz/dartz.dart';
import 'package:test_task_project/application/markets/data/datasources/markets_remote_data_source.dart';
import 'package:test_task_project/application/markets/domain/entities/market_entity.dart';
import 'package:test_task_project/application/markets/domain/repositories/markets_repository.dart';
import 'package:test_task_project/core/error/app_exceptions.dart';
import 'package:test_task_project/core/error/failure.dart';

class MarketsRepositoryImpl implements MarketsRepository {
  final MarketsRemoteDataSource marketsRemoteDataSource;

  MarketsRepositoryImpl(this.marketsRemoteDataSource);

  @override
  Future<Either<Failure, MarketEntity>> getMarketsAsync({
    required int limit,
    required int offset,
  }) async {
    try {
      final market = await marketsRemoteDataSource.getMarketsAsync(
        limit: limit,
        offset: offset,
      );
      return Right(market);
    } on ServerException catch (message) {
      return Left(ServerFailure(message: message.toString()));
    } on Exception catch (message) {
      return Left(GlobalFailure(message: message.toString()));
    }
  }
}
