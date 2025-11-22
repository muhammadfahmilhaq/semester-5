import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init(); // Inisialisasi GetStorage [cite: 330]
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage());
  }
}

class HomePage extends StatelessWidget {
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Get Storage Example")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Menyimpan data
                box.write('username', 'Flutter User');
                Get.snackbar("Data", "Data disimpan");
              },
              child: Text("Simpan data"),
            ),
            ElevatedButton(
              onPressed: () {
                // Mengambil data
                String username = box.read('username') ?? 'Tidak ada data';
                Get.snackbar("Data", username);
              },
              child: Text("Ambil data"),
            ),
            ElevatedButton(
              onPressed: () {
                // Menghapus data
                box.remove('username');
                Get.snackbar("Data", "Data dihapus");
              },
              child: Text("Hapus data"),
            ),
          ],
        ),
      ),
    );
  }
}
