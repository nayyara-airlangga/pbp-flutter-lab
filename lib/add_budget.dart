import 'package:counter_7/app_drawer.dart';
import 'package:counter_7/budget_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'globals.dart' as globals;

class AddBudgetPage extends StatefulWidget {
  const AddBudgetPage({super.key});

  @override
  State<AddBudgetPage> createState() => _AddBudgetPageState();
}

class Budget {
  String judul;
  int nominal;
  String tipe;
  DateTime tanggal;

  Budget({
    required this.judul,
    required this.nominal,
    required this.tipe,
    required this.tanggal,
  });
}

class _AddBudgetPageState extends State<AddBudgetPage> {
  final _formKey = GlobalKey<FormState>();

  final List<String> listTipeBudget = ['Pemasukan', 'Pengeluaran'];

  String? _judul;
  int? nominal;
  String? tipe;
  DateTime tanggal = DateTime.now();

  saveBudget(BuildContext context) {
    var data = Budget(
        judul: _judul!, nominal: nominal!, tipe: tipe!, tanggal: tanggal);
    globals.budgets.add(data);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const BudgetDataPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Form Budget"),
      ),
      drawer: const AppDrawer(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Beli Makan",
                      labelText: "Judul",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        _judul = value!;
                      });
                    },
                    onSaved: (String? value) {
                      setState(() {
                        _judul = value!;
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Judul tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "15000",
                      labelText: "Nominal",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    onChanged: (String? value) {
                      setState(() {
                        if (value != '') {
                          nominal = int.parse(value!);
                        }
                      });
                    },
                    onSaved: (String? value) {
                      setState(() {
                        if (value != '') {
                          nominal = int.parse(value!);
                        }
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Nominal tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                ),
                ListTile(
                  title: Text(tanggal.toString()),
                  leading: TextButton.icon(
                    icon: const Icon(Icons.calendar_today),
                    label: const Text("Pilih Tanggal"),
                    onPressed: () {
                      showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                      ).then((date) {
                        setState(() {
                          tanggal = date!;
                        });
                      });
                    },
                  ),
                ),
                DropdownButtonHideUnderline(
                  child: DropdownButton(
                    value: tipe,
                    icon: const Icon(Icons.arrow_drop_down),
                    items: listTipeBudget.map((String item) {
                      return DropdownMenuItem(
                        value: item,
                        child: Text(item),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        tipe = newValue!;
                      });
                    },
                    hint: const SizedBox(
                      width: 150,
                      child: Text(
                        "Pilih Jenis",
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.all(15.0),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    alignment: Alignment.center,
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      if (tipe == null || tipe == '') {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return Dialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              elevation: 15,
                              child: ListView(
                                padding: const EdgeInsets.only(
                                  top: 20,
                                  bottom: 20,
                                ),
                                shrinkWrap: true,
                                children: <Widget>[
                                  const Center(
                                    child: Text(
                                      'Tipe budget tidak boleh kosong',
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text('Kembali'),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      } else {
                        saveBudget(context);
                      }
                    }
                  },
                  child: const Text(
                    "Simpan",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
