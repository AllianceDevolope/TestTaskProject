import 'package:test_task_project/application/markets/data/models/market_pair_model.dart';
import 'package:test_task_project/application/markets/domain/entities/market_entity.dart';

class MarketModel extends MarketEntity {
  MarketModel({required super.timestamp, required super.data});

  factory MarketModel.fromJson(Map<String, dynamic> json) {
    return MarketModel(
      timestamp: json['timestamp'],
      data: json['data'] != null
          ? (json['data'] as List<dynamic>)
                .map((json) => MarketPairModel.fromJson(json))
                .toList()
          : [],
    );
  }
}
