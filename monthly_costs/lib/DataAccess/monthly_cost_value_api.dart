import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:monthly_costs/Models/cost_value.dart';

Future<String> createCostValue(CostValue costvalue) async {
  final response = await http.post(
      Uri.parse('http://192.168.0.187:8002/api/v1/costvalues'),
      body: jsonEncode(costvalue.toJson()),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      });

  if (response.statusCode != 202) {
    print('Failed to post data: ${response.statusCode}');

    return '';
  }

  final json = jsonDecode(response.body);
  return json['id'];
}
