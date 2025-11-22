import 'package:flutter/material.dart';
import 'package:get/get.dart';

// === Controller: FormController ===
class FormController extends GetxController {
  // Variabel reaktif untuk state form
  var name = ''.obs;
  var email = ''.obs;

  void updateName(String newName) {
    name.value = newName;
  }

  void updateEmail(String newEmail) {
    email.value = newEmail;
  }

  bool validateForm() {
    return name.isNotEmpty && email.isNotEmpty;
  }
}

// === Binding: FormBinding ===
class FormBinding extends Bindings {
  void dependencies() {
    // Menghubungkan FormController ke page secara otomatis
    Get.put<FormController>(FormController());
  }
}

// === UI: FormPage ===
class FormPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Mengakses controller secara otomatis karena sudah di-binding
    final controller = Get.find<FormController>();
    return Scaffold(
      appBar: AppBar(title: Text("Bindings Form Example")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              onChanged: controller.updateName,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              onChanged: controller.updateEmail,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            SizedBox(height: 20),
            Obx(() => Text("Name: ${controller.name.value}")),
            Obx(() => Text("Email: ${controller.email.value}")),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (controller.validateForm()) {
                  Get.snackbar("Success", "Form berhasil dikirim!");
                } else {
                  Get.snackbar("Error", "Nama dan Email tidak boleh kosong!");
                }
              },
              child: Text("Kirim"),
            ),
          ],
        ),
      ),
    );
  }
}

// === Main: MyApp ===
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'GetX Bindings Form Example',
      initialRoute: '/form',
      getPages: [
        GetPage(
          name: '/form',
          page: () => FormPage(),
          binding: FormBinding(), // binding the FormController to this page
        ),
      ],
    );
  }
}
