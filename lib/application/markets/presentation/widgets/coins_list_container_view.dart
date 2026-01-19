import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task_project/application/markets/domain/entities/market_pair_entity.dart';
import 'package:test_task_project/application/markets/presentation/bloc/markets_bloc.dart';
import 'package:test_task_project/application/markets/presentation/bloc/markets_event.dart';
import 'package:test_task_project/application/markets/presentation/widgets/coins_item_container_view.dart';

class CoinsListContainerView extends StatefulWidget {
  final List<MarketPairEntity> markets;
  const CoinsListContainerView(this.markets, {super.key});

  @override
  State<CoinsListContainerView> createState() => _CoinsListContainerViewState();
}

class _CoinsListContainerViewState extends State<CoinsListContainerView> {
  late final ScrollController scrollController;
  bool isLoadingMore = false;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController()..addListener(_onScroll);
  }

  void _onScroll() {
    if (scrollController.position.pixels >=
            scrollController.position.maxScrollExtent - 200 &&
        !isLoadingMore) {
      isLoadingMore = true;

      context.read<MarketsBloc>().add(
        GetMarketsEvent(limit: 15, offset: widget.markets.length),
      );
    }
  }

  @override
  void dispose() {
    scrollController.removeListener(_onScroll);
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: ListView.separated(
            controller: scrollController,
            itemBuilder: (context, index) =>
                CoinsItemContainerView(widget.markets[index]),
            separatorBuilder: (context, index) => const SizedBox(height: 35),
            itemCount: widget.markets.length,
          ),
        ),
        if (isLoadingMore) const CircularProgressIndicator(),
      ],
    );
  }

  @override
  void didUpdateWidget(covariant CoinsListContainerView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.markets.length != oldWidget.markets.length) {
      isLoadingMore = false;
    }
  }
}
