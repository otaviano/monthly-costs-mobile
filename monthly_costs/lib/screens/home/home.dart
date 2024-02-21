import 'package:flutter/material.dart';
import 'package:monthly_costs/DataAccess/monthly_cost_api.dart';
import 'package:monthly_costs/Models/Cost.dart';
import 'package:monthly_costs/components/list_costs.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<List<Cost>>? futureCosts;

  @override
  void initState() {
    futureCosts = getAllCosts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(),
      body: body(),
    );
  }

  AppBar header() {
    return AppBar(
      toolbarHeight: 250,
      backgroundColor: Colors.transparent,
      flexibleSpace: Image(
        image: AssetImage('assets/images/logo-leaf-black.png'),
        fit: BoxFit.cover,
      ),
      centerTitle: true,
    );
  }

  FutureBuilder<List<Cost>> body() {
    return FutureBuilder(
      future: futureCosts,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final costs = snapshot.data as List<Cost>;
          return Center(
              child: Stack(children: [
                Text("Minhas contas mensais",style: const TextStyle( fontSize: 15)), 
                ListCosts(costs: costs)]));
        } else if (snapshot.hasError) {
          return Center(
            child: Text(
              snapshot.error.toString(),
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
