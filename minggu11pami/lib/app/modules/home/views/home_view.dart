import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    // MediaQuery
    final size = MediaQuery.of(context).size;
    final orientation = MediaQuery.of(context).orientation;

    return Scaffold(
      appBar: AppBar(
        title: Text("Praktikum Responsive UI"),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              // ============================
              // 1. MEDIAQUERY
              // ============================
              Text(
                "MediaQuery Example",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(height: 10),
              Text("Lebar: ${size.width}"),
              Text("Tinggi: ${size.height}"),
              Text("Orientasi: $orientation"),

              SizedBox(height: 30),

              // ============================
              // 2. FLEXIBLE
              // ============================
              Text(
                "Flexible Example",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(height: 10),

              Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: Container(
                      height: 60,
                      color: Colors.red,
                      child: Center(child: Text("1x")),
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: Container(
                      height: 60,
                      color: Colors.blue,
                      child: Center(child: Text("2x")),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 30),

              // ============================
              // 3. EXPANDED
              // ============================
              Text(
                "Expanded Example",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(height: 10),

              Row(
                children: [
                  Container(
                    width: 80,
                    height: 60,
                    color: Colors.orange,
                    child: Center(child: Text("Fix")),
                  ),
                  Expanded(
                    child: Container(
                      height: 60,
                      color: Colors.green,
                      child: Center(child: Text("Expanded")),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 30),

              // ============================
              // 4. FITTED BOX
              // ============================
              Text(
                "FittedBox Example",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(height: 10),

              Container(
                width: 200,
                height: 80,
                color: Colors.grey[300],
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    "Teks Panjang Banget Yang Dikecilkan",
                    style: TextStyle(fontSize: 50),
                  ),
                ),
              ),

              SizedBox(height: 30),

              // ============================
              // 5. WRAP
              // ============================
              Text(
                "Wrap Example",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(height: 10),

              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  Chip(label: Text("Flutter")),
                  Chip(label: Text("Responsive")),
                  Chip(label: Text("MediaQuery")),
                  Chip(label: Text("Flexible")),
                  Chip(label: Text("Expanded")),
                  Chip(label: Text("Wrap Widget")),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
