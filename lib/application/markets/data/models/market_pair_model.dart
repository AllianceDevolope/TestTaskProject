import 'package:test_task_project/application/markets/domain/entities/market_pair_entity.dart';

class MarketPairModel extends MarketPairEntity {
  MarketPairModel({
    required super.exchangeId,
    required super.rank,
    required super.baseSymbol,
    required super.baseId,
    required super.quoteSymbol,
    required super.quoteId,
    required super.priceQuote,
    required super.priceUsd,
    required super.volumeUsd24Hr,
    required super.percentExchangeVolume,
    required super.tradesCount24Hr,
    required super.updated,
  });

  factory MarketPairModel.fromJson(Map<String, dynamic> json) {
    return MarketPairModel(
      exchangeId: json['exchangeId'],
      rank: json['rank'],
      baseSymbol: json['baseSymbol'],
      baseId: json['baseId'],
      quoteSymbol: json['quoteSymbol'],
      quoteId: json['quoteId'],
      priceQuote: json['priceQuote'],
      priceUsd: json['priceUsd'],
      volumeUsd24Hr: json['volumeUsd24Hr'],
      percentExchangeVolume: json['percentExchangeVolume'],
      tradesCount24Hr: json['tradesCount24Hr'],
      updated: json['updated'],
    );
  }
}
