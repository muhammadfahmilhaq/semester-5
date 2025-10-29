import 'package:flutter/material.dart';
import '../models/vehicle.dart';
import '../widgets/vehicle_card.dart';
import 'detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Vehicle> vehicles = [
    Vehicle(
      name: "Civic Type R",
      brand: "Honda",
      imageUrl: "https://images.bisnis.com/posts/2021/05/09/1392188/honda-civic-type-r.jpg",
      engineType: "2.0L Turbocharged",
      year: 2023,
      transmission: "Manual 6-speed",
      price: 1200000000,
    ),
    Vehicle(
      name: "GR Supra",
      brand: "Toyota",
      imageUrl: "https://imgcdn.oto.com/large/gallery/exterior/38/2165/toyota-supra-front-angle-low-view-682397.jpg",
      engineType: "3.0L Turbo Inline-6",
      year: 2022,
      transmission: "Automatic 8-speed",
      price: 1800000000,
    ),
    Vehicle(
      name: "Model S",
      brand: "Tesla",
      imageUrl: "https://imgcdn.oto.com/large/gallery/exterior/133/2221/tesla-model-s-front-angle-low-view-795594.jpg",
      engineType: "Electric Dual Motor",
      year: 2024,
      transmission: "Automatic",
      price: 2500000000,
    ),
  ];

  String searchQuery = "";

  @override
  Widget build(BuildContext context) {
    final filteredVehicles = vehicles
        .where((v) =>
    v.name.toLowerCase().contains(searchQuery.toLowerCase()) ||
        v.brand.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Daftar Otomotif", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
        elevation: 8,
        shadowColor: Colors.blueAccent.withOpacity(0.3),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[850],
                hintText: "Cari kendaraan...",
                hintStyle: const TextStyle(color: Colors.grey),
                prefixIcon: const Icon(Icons.search, color: Colors.blueAccent),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
              ),
              onChanged: (value) {
                setState(() => searchQuery = value);
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: filteredVehicles.length,
              itemBuilder: (context, index) {
                final vehicle = filteredVehicles[index];
                return VehicleCard(
                  vehicle: vehicle,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => DetailPage(vehicle: vehicle),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
