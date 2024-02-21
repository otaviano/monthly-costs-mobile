import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:monthly_costs/Models/Cost.dart';

Future<List<Cost>> getAllCosts() async {
  final response =
      await http.get(Uri.parse('http://192.168.0.187:8002/api/v1/costs'));

  if (response.statusCode != 200) { return Future.error("Ops! Um erro ocorreu."); } 

  final json = jsonDecode(response.body);
  return List<Cost>.from(json.map((element) {
    return Cost.fromJson(element);
  }));
}
