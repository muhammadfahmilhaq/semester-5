import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import './models/user.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Future Builder",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(fontFamily: 'Roboto', color: Colors.black87),
        ),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Future<List<UserModel>> getAllUser() async {
    try {
      var response =
      await http.get(Uri.parse("https://reqres.in/api/users?page=1"));
      List data = (json.decode(response.body) as Map<String, dynamic>)['data'];
      return data.map((e) => UserModel.fromJson(e)).toList();
    } catch (e) {
      print("Terjadi kesalahan: $e");
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF6EE7B7), Color(0xFF3B82F6)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Header App
              Container(
                padding: const EdgeInsets.all(16),
                child: const Text(
                  "Future Builder",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 1.2,
                  ),
                ),
              ),
              Expanded(
                child: FutureBuilder<List<UserModel>>(
                  future: getAllUser(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(color: Colors.white),
                      );
                    } else if (snapshot.hasError || snapshot.data!.isEmpty) {
                      return const Center(
                        child: Text(
                          "Tidak ada data ditemukan",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      );
                    } else {
                      var users = snapshot.data!;
                      return ListView.builder(
                        padding: const EdgeInsets.all(10),
                        itemCount: users.length,
                        itemBuilder: (context, index) {
                          var user = users[index];
                          return Container(
                            margin: const EdgeInsets.symmetric(vertical: 8),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.9),
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 6,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: ListTile(
                              contentPadding: const EdgeInsets.all(12),
                              leading: CircleAvatar(
                                radius: 28,
                                backgroundImage: NetworkImage(user.avatar),
                              ),
                              title: Text(
                                "${user.firstName} ${user.lastName}",
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Text(
                                user.email,
                                style: const TextStyle(
                                  color: Colors.black54,
                                ),
                              ),
                              trailing: const Icon(Icons.arrow_forward_ios_rounded,
                                  color: Colors.teal),
                              onTap: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                        "Kamu memilih ${user.firstName}"),
                                    backgroundColor: Colors.teal,
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
