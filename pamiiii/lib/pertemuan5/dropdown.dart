import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, dynamic>> data = [
    {"judul": "Opsi - 1", "data": 1},
    {"judul": "Opsi - 2", "data": 2},
    {"judul": "Opsi - 3", "data": 3},
  ];

  late int dataAwal;

  @override
  void initState() {
    dataAwal = data[1]["data"];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purpleAccent,
        title: const Text("fahmilhaq"),
        centerTitle: false,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: DropdownButton<int>(
            value: dataAwal,
            items: data
                .map(
                  (e) => DropdownMenuItem<int>(
                child: Text("${e['judul']}"),
                value: e['data'] as int,
              ),
            )
                .toList(),
            onChanged: (value) {
              setState(() {
                dataAwal = value!;
              });
            },
          ),
        ),
      ),
    );
  }
}