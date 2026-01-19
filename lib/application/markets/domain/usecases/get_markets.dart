import 'package:dartz/dartz.dart';
import 'package:test_task_project/application/markets/domain/entities/market_entity.dart';
import 'package:test_task_project/application/markets/domain/repositories/markets_repository.dart';
import 'package:test_task_project/core/error/failure.dart';

class GetMarkets {
  final MarketsRepository marketsRepository;

  GetMarkets(this.marketsRepository);

  Future<Either<Failure, MarketEntity>> call({
    required int limit,
    required int offset,
  }) async {
    return await marketsRepository.getMarketsAsync(
      limit: limit,
      offset: offset,
    );
  }
}
