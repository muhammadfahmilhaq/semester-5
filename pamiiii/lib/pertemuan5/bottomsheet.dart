import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purpleAccent,
        title: const Text("fahmilhaq"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: ElevatedButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: false,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                builder: (context) => SizedBox(
                  height: 250,
                  child: ListView(
                    children: [
                      ListTile(
                        onTap: () => print("Klik Foto"),
                        leading: const Icon(Icons.photo),
                        title: const Text("Foto"),
                      ),
                      ListTile(
                        onTap: () => print("Klik Music"),
                        leading: const Icon(Icons.music_note_rounded),
                        title: const Text("Music"),
                      ),
                      ListTile(
                        onTap: () => print("Klik Video"),
                        leading: const Icon(Icons.video_collection),
                        title: const Text("Video"),
                      ),
                      ListTile(
                        onTap: () => print("Klik Share"),
                        leading: const Icon(Icons.share),
                        title: const Text("Share"),
                      ),
                      ListTile(
                        onTap: () => Navigator.pop(context),
                        leading: const Icon(Icons.cancel),
                        title: const Text("Cancel"),
                      ),
                    ],
                  ),
                ),
              );
            },
            child: const Text("Show Bottom Sheet"),
          ),
        ),
      ),
    );
  }
}