import 'package:flutter/material.dart';
import '../models/vehicle.dart';

class VehicleCard extends StatelessWidget {
  final Vehicle vehicle;
  final VoidCallback onTap;

  const VehicleCard({
    Key? key,
    required this.vehicle,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Widget untuk menampilkan gambar (baik dari internet maupun lokal)
    final imageWidget = vehicle.imageUrl.startsWith('http')
        ? Image.network(
      vehicle.imageUrl,
      height: 100,
      width: 120,
      fit: BoxFit.cover,
      // jika gambar gagal dimuat
      errorBuilder: (context, error, stackTrace) => Container(
        height: 100,
        width: 120,
        color: Colors.grey[800],
        alignment: Alignment.center,
        child: const Icon(Icons.broken_image, color: Colors.white54),
      ),
    )
        : Image.asset(
      vehicle.imageUrl,
      height: 100,
      width: 120,
      fit: BoxFit.cover,
    );

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      splashColor: Colors.blueAccent.withOpacity(0.2),
      child: Card(
        color: Colors.grey[900],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 8,
        shadowColor: Colors.blueAccent.withOpacity(0.4),
        child: Row(
          children: [
            // Gambar kendaraan
            ClipRRect(
              borderRadius:
              const BorderRadius.horizontal(left: Radius.circular(16)),
              child: imageWidget,
            ),

            // Detail kendaraan
            Expanded(
              child: Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      vehicle.name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      vehicle.brand,
                      style:
                      const TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      "Rp ${_formatPrice(vehicle.price)}",
                      style: const TextStyle(
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Fungsi bantu untuk memformat harga agar lebih rapi
  static String _formatPrice(num price) {
    final str = price.toStringAsFixed(0);
    final buffer = StringBuffer();
    for (int i = 0; i < str.length; i++) {
      int index = str.length - i;
      buffer.write(str[i]);
      if (index > 1 && index % 3 == 1 && i != str.length - 1) {
        buffer.write('.');
      }
    }
    return buffer.toString();
  }
}
