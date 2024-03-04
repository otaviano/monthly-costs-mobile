import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:monthly_costs/Models/cost_value.dart';
import 'package:monthly_costs/DataAccess/monthly_cost_value_api.dart';
import 'package:monthly_costs/Utils/date_month.dart';
import 'package:monthly_costs/components/header.dart';

class CostValueForm extends StatefulWidget {
  final String costId;
  final String costName;

  CostValueForm({super.key, required this.costId, required this.costName});

  @override
  CostValueFormState createState() {
    return CostValueFormState();
  }
}

class CostValueFormState extends State<CostValueForm> {
  final _formKey = GlobalKey<FormState>();
  late CostValue _costValue;
  final myController = TextEditingController();
  Future<String>? sumOfCurrentMonth;

  CostValueFormState();
  @override
  void initState() {
    super.initState();
    sumOfCurrentMonth = getSumOfCurrentMonth(widget.costId);
    _costValue = CostValue(
        id: '',
        costId: widget.costId,
        value: 0.0,
        month: getDateByMonth(DateTime.now().month.toString()).toString());
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      createCostValue(_costValue);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Valor registrado com sucesso!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                style: TextStyle(fontSize: 25, color: Color.fromRGBO(32, 70, 32, 0.898)),
                widget.costName),
              FutureBuilder(
                  future: sumOfCurrentMonth,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Text(snapshot.data ?? "0.0", style: TextStyle(fontSize: 20, color: Color.fromRGBO(32, 70, 32, 0.898)));
                    } else if (snapshot.hasError) {
                      return Text('Error summarizing total month!!!');
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }),
              TextFormField(
                decoration: InputDecoration(labelText: 'Valor'),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(
                      RegExp(r'[0-9]+[.]{0,1}[0-9]*'))
                ],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter value';
                  }
                  return null;
                },
                onSaved: (value) {
                  _costValue.value = double.parse(value!);
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Mês'),
                initialValue: getMonthNow().toString(),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp('[1-12]'))
                ],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Favor entrar com um mês válido';
                  }
                  return null;
                },
                onSaved: (value) {
                  _costValue.month = getDateOnlyByMonth(value!);
                },
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Salvar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
