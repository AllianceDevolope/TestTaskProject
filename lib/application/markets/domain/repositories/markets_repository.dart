import 'package:dartz/dartz.dart';
import 'package:test_task_project/application/markets/domain/entities/market_entity.dart';
import 'package:test_task_project/core/error/failure.dart';

abstract class MarketsRepository {
  Future<Either<Failure, MarketEntity>> getMarketsAsync({
    required int limit,
    required int offset,
  });
}
