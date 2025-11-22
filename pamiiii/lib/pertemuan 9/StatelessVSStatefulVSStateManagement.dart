import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Stateless • Stateful • GetX")),
        body: ExamplePage(),
      ),
    );
  }
}

// ===========================
//  CONTROLLER GETX
// ===========================
class CounterController extends GetxController {
  var counter = 0.obs;
  void increment() => counter++;
}

// ===========================
//  HALAMAN CONTOH
// ===========================
class ExamplePage extends StatelessWidget {
  final CounterController c = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("StatelessWidget Example:", style: TextStyle(fontSize: 18)),
          StatelessExample(),

          SizedBox(height: 30),

          Text("StatefulWidget Example:", style: TextStyle(fontSize: 18)),
          StatefulExample(),

          SizedBox(height: 30),

          Text("GetX State Management:", style: TextStyle(fontSize: 18)),
          GetXExample(),
        ],
      ),
    );
  }
}

// ===========================
//  EXAMPLE STATELESS
// ===========================
class StatelessExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text("Stateless tidak bisa berubah sendiri.");
  }
}

// ===========================
//  EXAMPLE STATEFUL
// ===========================
class StatefulExample extends StatefulWidget {
  @override
  _StatefulExampleState createState() => _StatefulExampleState();
}

class _StatefulExampleState extends State<StatefulExample> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("Counter: $counter"),
        SizedBox(width: 10),
        ElevatedButton(
          onPressed: () {
            setState(() {
              counter++;
            });
          },
          child: Text("Tambah"),
        )
      ],
    );
  }
}

// ===========================
//  EXAMPLE GETX
// ===========================
class GetXExample extends StatelessWidget {
  final CounterController c = Get.find();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Obx(() => Text("Counter: ${c.counter}")),
        SizedBox(width: 10),
        ElevatedButton(
          onPressed: c.increment,
          child: Text("Tambah (GetX)"),
        )
      ],
    );
  }
}
