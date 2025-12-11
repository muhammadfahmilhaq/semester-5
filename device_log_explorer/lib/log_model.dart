class LogEntry {
  final String id;
  final String timestamp;
  final double latitude;
  final double longitude;
  final String imagePath;

  LogEntry({
    required this.id,
    required this.timestamp,
    required this.latitude,
    required this.longitude,
    required this.imagePath,
  });

  factory LogEntry.fromJson(Map<String, dynamic> json) {
    return LogEntry(
      id: json['id'] ?? '',
      timestamp: json['timestamp'] ?? '',
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      imagePath: json['imagePath'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'timestamp': timestamp,
      'latitude': latitude,
      'longitude': longitude,
      'imagePath': imagePath,
    };
  }
}
