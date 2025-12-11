import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'dart:io';
import 'log_model.dart';
import 'log_storage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Device Log Explorer',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const LogExplorerScreen(),
    );
  }
}

class LogExplorerScreen extends StatefulWidget {
  const LogExplorerScreen({super.key});

  @override
  State<LogExplorerScreen> createState() => _LogExplorerScreenState();
}

class _LogExplorerScreenState extends State<LogExplorerScreen> {
  final LogStorage _storage = LogStorage();
  List<LogEntry> _logs = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadLogs();
  }

  Future<void> _loadLogs() async {
    setState(() => _isLoading = true);

    final loaded = await _storage.loadLogs();
    setState(() {
      _logs = loaded;
      _isLoading = false;
    });
  }

  Future<void> _createLog() async {
    Position? position;

    try {
      LocationPermission permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }

      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        _showSnackBar("Izin lokasi ditolak.");
        return;
      }

      position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
    } catch (e) {
      _showSnackBar("Gagal mendapatkan lokasi: $e");
      return;
    }

    final picker = ImagePicker();
    XFile? photo;

    try {
      photo = await picker.pickImage(source: ImageSource.camera);
    } catch (e) {
      _showSnackBar("Gagal membuka kamera: $e");
      return;
    }

    if (photo == null) {
      _showSnackBar("Pengambilan foto dibatalkan.");
      return;
    }

    final log = LogEntry(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      timestamp: DateFormat('dd-MM-yyyy HH:mm:ss').format(DateTime.now()),
      latitude: position.latitude,
      longitude: position.longitude,
      imagePath: photo.path,
    );

    _logs.add(log);
    await _storage.saveLogs(_logs);

    setState(() {});
    _showSnackBar("Log baru berhasil dibuat.");
  }

  void _showSnackBar(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Device Log Explorer')),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _logs.isEmpty
          ? const Center(
              child: Text("Tekan '+' untuk membuat log pertama Anda."),
            )
          : ListView.builder(
              itemCount: _logs.length,
              itemBuilder: (context, index) {
                final log = _logs[index];
                return LogCard(log: log);
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _createLog,
        child: const Icon(Icons.add_a_photo),
      ),
    );
  }
}

class LogCard extends StatelessWidget {
  final LogEntry log;
  const LogCard({super.key, required this.log});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'ID Log: ${log.id}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text('Waktu: ${log.timestamp}'),
            Text(
              'Lokasi: Lat ${log.latitude.toStringAsFixed(4)}, Lon ${log.longitude.toStringAsFixed(4)}',
            ),
            const SizedBox(height: 8),
            Container(
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
              child: Image.file(
                File(log.imagePath),
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    const Center(child: Text("Foto tidak ditemukan")),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
