import 'package:flutter/material.dart';

void main() {
  runApp(const ECommerceProductApp());
}

class ECommerceProductApp extends StatelessWidget {
  const ECommerceProductApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Detail Produk Keren',
      theme: ThemeData(
          primarySwatch: Colors.teal,
          scaffoldBackgroundColor: Colors.grey[50],
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            elevation: 0,
          )
      ),
      home: const ProductDetailPage(),
    );
  }
}

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 400.0,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                "https://cdn.shopify.com/s/files/1/0073/0762/products/Mister_Zimi_-_Frankie_-_Blue_Retro_Flower.jpg?v=1667954117",
                fit: BoxFit.cover,
              ),
            ),
            // Aksi di AppBar
            actions: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.share_outlined)),
              IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_cart_outlined)),
            ],
          ),

          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Kemeja Retro Bunga Biru Edisi Terbatas",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        "Rp 299.000",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Row(
                        children: [
                          const Icon(Icons.star, color: Colors.amber, size: 20),
                          const Text(" 4.9 ", style: TextStyle(fontWeight: FontWeight.bold)),
                          Text(
                            "(1.2k Rating) | 7.5k Terjual",
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                          const Spacer(),
                          const Icon(Icons.favorite_border, color: Colors.grey),
                        ],
                      ),
                      const Divider(height: 30),
                      Row(
                        children: [
                          const CircleAvatar(
                            backgroundColor: Colors.teal,
                            child: Icon(Icons.store, color: Colors.white),
                          ),
                          const SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text("Toko Fesyen Keren", style: TextStyle(fontWeight: FontWeight.bold)),
                              Text("Jakarta Barat", style: TextStyle(fontSize: 12, color: Colors.grey)),
                            ],
                          ),
                          const Spacer(),
                          OutlinedButton.icon(
                            onPressed: () {},
                            icon: const Icon(Icons.chat_bubble_outline, size: 16),
                            label: const Text("Chat"),
                          ),
                        ],
                      ),
                      const Divider(height: 30),
                      const Text(
                        "Deskripsi Produk",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        "Kemeja retro yang nyaman dan modis, dibuat dengan bahan katun premium. Desain bunga biru unik membuatnya menonjol di setiap kesempatan. Cocok untuk acara kasual atau semi-formal.",
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(height: 1.5),
                      ),
                      TextButton(
                        onPressed: () {
                        },
                        child: const Text("Lihat Selengkapnya", style: TextStyle(color: Colors.teal)),
                      ),
                      const SizedBox(height: 500),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, -3),
            ),
          ],
        ),
        child: Row(
          children: [
            OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.add_shopping_cart_outlined, color: Colors.teal),
              label: const Text("Keranjang", style: TextStyle(color: Colors.teal)),
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.teal),
                minimumSize: const Size(120, 50),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red[700],
                  minimumSize: const Size.fromHeight(50),
                ),
                child: const Text(
                  "Beli Sekarang",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}