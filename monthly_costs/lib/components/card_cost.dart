import 'package:flutter/material.dart';
import 'package:monthly_costs/Models/Cost.dart';
import 'package:monthly_costs/screens/cost_value/cost_value_form.dart';

class CardCost extends StatelessWidget {
  final Cost cost;

  const CardCost( {Key? key, required this.cost})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
            width: 100.0,
            height: 100.0,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Color.fromRGBO(133, 172, 147, 0.498)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    side: BorderSide(color: Color.fromARGB(255, 65, 69, 71))))),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CostValueForm(costId: cost.id, costName: cost.name)),
                );
              },
              child: Text(cost.name, style: TextStyle(color: Colors.black),)
            )
        ),
      ],
    );
  }
}
