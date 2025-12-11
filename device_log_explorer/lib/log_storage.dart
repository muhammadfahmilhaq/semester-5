import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'log_model.dart';

class LogStorage {
  Future<File> get _localFile async {
    final directory = await getApplicationDocumentsDirectory();
    return File('${directory.path}/device_logs.json');
  }

  Future<List<LogEntry>> loadLogs() async {
    try {
      final file = await _localFile;

      if (!await file.exists()) {
        return [];
      }

      final content = await file.readAsString();

      if (content.trim().isEmpty) {
        return [];
      }

      final List<dynamic> jsonList = jsonDecode(content);

      return jsonList.map((json) => LogEntry.fromJson(json)).toList();
    } catch (e) {
      print("Error load log → $e");
      return [];
    }
  }

  Future<File> saveLogs(List<LogEntry> logs) async {
    try {
      final file = await _localFile;
      final jsonList = logs.map((e) => e.toJson()).toList();
      return file.writeAsString(jsonEncode(jsonList));
    } catch (e) {
      rethrow;
    }
  }
}
