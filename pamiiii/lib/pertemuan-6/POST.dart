import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController nameC = TextEditingController();
  TextEditingController jobC = TextEditingController();

  String hasilResponse = "Belum ada data";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HTTP POST"),
        backgroundColor: Colors.teal, // Ubah warna app bar
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Menambah padding di seluruh layar
        child: Center(
          child: SingleChildScrollView( // Membuat tampilan scrollable
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Masukkan Data',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 30), // Memberikan jarak
                TextField(
                  controller: nameC,
                  autocorrect: false,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[200], // Warna background input
                    border: OutlineInputBorder(),
                    labelText: "Name",
                    labelStyle: TextStyle(color: Colors.teal), // Warna label
                    contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  ),
                ),
                SizedBox(height: 15), // Memberikan jarak
                TextField(
                  controller: jobC,
                  autocorrect: false,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[200], // Warna background input
                    border: OutlineInputBorder(),
                    labelText: "Job",
                    labelStyle: TextStyle(color: Colors.teal), // Warna label
                    contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  ),
                ),
                SizedBox(height: 30), // Memberikan jarak
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal, // Warna tombol
                    padding: EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8), // Memberikan sudut melengkung
                    ),
                    textStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () async {
                    var myresponse = await http.post(
                      Uri.parse("https://reqres.in/api/users"),
                      body: {'name': nameC.text, 'job': jobC.text},
                    );

                    Map<String, dynamic> data = json.decode(myresponse.body) as Map<String, dynamic>;

                    setState(() {
                      hasilResponse = "${data['name']} - ${data['job']}";
                    });
                  },
                  child: Text("SUBMIT"),
                ),
                SizedBox(height: 40), // Memberikan jarak
                Divider(
                  color: Colors.teal, // Warna divider
                  thickness: 2,
                ),
                SizedBox(height: 10), // Memberikan jarak
                Text(
                  hasilResponse,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.teal,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
