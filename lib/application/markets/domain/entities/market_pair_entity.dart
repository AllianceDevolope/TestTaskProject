class MarketPairEntity {
  String? exchangeId;
  String? rank;
  String? baseSymbol;
  String? baseId;
  String? quoteSymbol;
  String? quoteId;
  String? priceQuote;
  String? priceUsd;
  String? volumeUsd24Hr;
  String? percentExchangeVolume;
  String? tradesCount24Hr;
  int? updated;

  MarketPairEntity({
    required this.exchangeId,
    required this.rank,
    required this.baseSymbol,
    required this.baseId,
    required this.quoteSymbol,
    required this.quoteId,
    required this.priceQuote,
    required this.priceUsd,
    required this.volumeUsd24Hr,
    required this.percentExchangeVolume,
    required this.tradesCount24Hr,
    required this.updated,
  });
}
