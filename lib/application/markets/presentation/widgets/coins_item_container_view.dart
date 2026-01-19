import 'package:flutter/material.dart';
import 'package:test_task_project/application/markets/domain/entities/market_pair_entity.dart';
import 'package:test_task_project/core/helpers/color_heleper.dart';
import 'package:test_task_project/core/styles/styles.dart';

class CoinsItemContainerView extends StatelessWidget {
  final MarketPairEntity market;
  const CoinsItemContainerView(this.market, {super.key});

  @override
  Widget build(BuildContext context) {
    double price = double.parse(market.priceUsd!);
    return Row(
      children: [
        Container(
          height: 56,
          width: 56,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            color: ColorHeleper.getRandomColor(),
          ),
        ),
        const SizedBox(width: 15),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(market.baseSymbol!, style: semiBold),
              Text('\$${price.toStringAsFixed(2)}', style: semiBold),
            ],
          ),
        ),
      ],
    );
  }
}
