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
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String data = "belum ada data";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PUT/PATCH"),
        actions: [
          IconButton(
            onPressed: () async {
              var response =
              await http.get(Uri.parse("https://reqres.in/api/users/2"));
              Map<String, dynamic> mybody = json.decode(response.body);
              setState(() {
                data =
                "Akun : ${mybody['data']['first_name']} ${mybody['data']['last_name']}";
              });
            },
            icon: Icon(Icons.get_app),
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          Text(data),
          SizedBox(height: 35),
          ElevatedButton(
            onPressed: () async {
              var response =
              await http.delete(Uri.parse("https://reqres.in/api/users/2"));
              if (response.statusCode == 204) {
                setState(() {
                  data = "Berhasil menghapus data";
                });
              }
            },
            child: Text("DELETE"),
          ),
        ],
      ),
    );
  }
}