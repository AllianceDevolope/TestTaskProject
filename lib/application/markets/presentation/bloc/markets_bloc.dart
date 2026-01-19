import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task_project/application/markets/domain/entities/market_pair_entity.dart';
import 'package:test_task_project/application/markets/domain/usecases/get_markets.dart';
import 'package:test_task_project/application/markets/presentation/bloc/markets_event.dart';
import 'package:test_task_project/application/markets/presentation/bloc/markets_state.dart';
import 'package:test_task_project/core/error/failure.dart';

class MarketsBloc extends Bloc<MarketsEvent, MarketsState> {
  final GetMarkets getMarkets;

  MarketsBloc(this.getMarkets) : super(MarketsInitialState()) {
    on<GetMarketsEvent>((event, emit) async {
      return _hanleMarketsGetAsync(event, emit);
    });
  }

  List<MarketPairEntity> allMarkets = [];

  Future<void> _hanleMarketsGetAsync(
    GetMarketsEvent event,
    Emitter<MarketsState> emit,
  ) async {
    if (event.offset == 0) {
      emit(MarketsLoadingState());
    }

    final failureOrResult = await getMarkets(
      limit: event.limit,
      offset: event.offset,
    );
    failureOrResult.fold(
      (failure) {
        emit(MarketsLoadFailedState(message: mapFailureToMessage(failure)));
      },
      (market) {
        if (event.offset == 0) {
          allMarkets = List.of(market.data!);
        } else {
          allMarkets.addAll(market.data!);
        }

        emit(MarketsLoadedState(markets: List.of(allMarkets)));
      },
    );
  }

  String mapFailureToMessage(Failure failure) {
    if (failure is GlobalFailure) return failure.message;
    if (failure is ServerFailure) return failure.message;
    return 'Unknown failure';
  }
}
