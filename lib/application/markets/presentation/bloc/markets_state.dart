import 'package:equatable/equatable.dart';
import 'package:test_task_project/application/markets/domain/entities/market_entity.dart';
import 'package:test_task_project/application/markets/domain/entities/market_pair_entity.dart';

abstract class MarketsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class MarketsInitialState extends MarketsState {}

class MarketsLoadingState extends MarketsState {}

class MarketsLoadFailedState extends MarketsState {
  final String message;

  MarketsLoadFailedState({required this.message});

  @override
  List<Object?> get props => [message];
}

class MarketsLoadedState extends MarketsState {
  final List<MarketPairEntity> markets;

  MarketsLoadedState({required this.markets});

  @override
  List<Object?> get props => [markets];
}
