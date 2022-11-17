import 'package:counter_7/app_drawer.dart';
import 'package:flutter/material.dart';

import 'globals.dart' as globals;

class BudgetDataPage extends StatefulWidget {
  const BudgetDataPage({super.key});

  @override
  State<BudgetDataPage> createState() => _BudgetDataPageState();
}

class _BudgetDataPageState extends State<BudgetDataPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Data Budget"),
      ),
      drawer: const AppDrawer(),
      body: Center(
        child: ListView.builder(
          itemCount: globals.budgets.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(5),
            child: Material(
              elevation: 2.0,
              borderRadius: BorderRadius.circular(5.0),
              shadowColor: Colors.blueGrey,
              child: ListTile(
                title: Text(globals.budgets[index].judul),
                subtitle: Text(globals.budgets[index].nominal.toString()),
                trailing: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Spacer(),
                    Text(globals.budgets[index].tipe),
                    Text(globals.budgets[index].tanggal.toString()),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
