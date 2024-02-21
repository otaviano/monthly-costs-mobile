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
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 10,
        childAspectRatio: 3 / 4,
      ),
      itemCount: costs.length,
      itemBuilder: ((context, index) {
        final cost = costs[index];
        return CardCost(
          id: cost.id,
          name: cost.name,
          avarage: cost.avarage,
          paymentMethod: cost.paymentMethod
        );
      }),
    );
  }
}