import 'package:flutter/material.dart';

class CardCost extends StatelessWidget {
  final String id;
  final String name;
  final String avarage;
  final String paymentMethod;

  const CardCost(
      {Key? key,
      required this.id,
      required this.name,
      required this.avarage,
      required this.paymentMethod})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
            width: 150.0,
            height: 150.0,
            child: ElevatedButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    side: BorderSide(color: Color.fromARGB(255, 65, 69, 71))))),
              onPressed: () {
                print(id);
              },
              child: Text(name)
            )
        ),
      ],
    );
  }
}
