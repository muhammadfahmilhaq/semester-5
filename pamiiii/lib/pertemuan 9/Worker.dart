import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WorkerController extends GetxController {
  var count = 0.obs;

  @override
  void onInit() {
    ever(count, (_) => print("ever: Count changed to $count"));

    once(count, (_) => print("once: Count changed to $count"));

    interval(
      count,
          (_) => print("interval: Count changed to $count"),
      time: Duration(seconds: 2),
    );

    super.onInit();
  }

  void increment() {
    count++;
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Workers Example")),
        body: WorkerExample(),
      ),
    );
  }
}

class WorkerExample extends StatelessWidget {
  final WorkerController wc = Get.put(WorkerController());

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Obx(() => Text(
            "Count: ${wc.count}",
            style: TextStyle(fontSize: 20),
          )),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: wc.increment,
            child: Text("Increment"),
          ),
        ],
      ),
    );
  }
}
