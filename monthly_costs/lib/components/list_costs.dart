import 'package:flutter/material.dart';
import 'package:monthly_costs/Models/Cost.dart';
import 'package:monthly_costs/components/card_cost.dart';

class ListCosts extends StatelessWidget {
  const ListCosts({
    Key? key,
    required this.costs,
  }) : super(key: key);

  final List<Cost> costs;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(20),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
      ),
      itemCount: costs.length,
      itemBuilder: ((context, index) {
        final cost = costs[index];
        return CardCost(cost: cost);
      }),
    );
  }
}