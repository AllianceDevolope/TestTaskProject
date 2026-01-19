import 'package:test_task_project/application/markets/domain/entities/market_pair_entity.dart';

class MarketEntity {
  int? timestamp;
  List<MarketPairEntity>? data;

  MarketEntity({required this.timestamp, required this.data});
}
