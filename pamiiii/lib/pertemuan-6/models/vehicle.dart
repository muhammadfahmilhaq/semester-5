class Vehicle {
  final String name;          // Nama kendaraan
  final String brand;         // Merek
  final String imageUrl;      // URL gambar
  final String engineType;    // Tipe mesin
  final int year;             // Tahun
  final String transmission;  // Transmisi
  final double price;         // Harga

  Vehicle({
    required this.name,
    required this.brand,
    required this.imageUrl,
    required this.engineType,
    required this.year,
    required this.transmission,
    required this.price,
  });
}
