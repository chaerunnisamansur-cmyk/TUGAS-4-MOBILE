import 'package:flutter/material.dart';

void main() {
  runApp(const RestaurantApp());
}

class RestaurantApp extends StatelessWidget {
  const RestaurantApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Detail Restoran',
      theme: ThemeData(
        primarySwatch: Colors.green,
        fontFamily: 'Arial',
      ),
      home: const RestaurantDetailPage(),
    );
  }
}

class RestaurantDetailPage extends StatelessWidget {
  const RestaurantDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // Tombol reservasi
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Reservasi berhasil dipilih!'),
            ),
          );
        },
        backgroundColor: Colors.green,
        icon: const Icon(Icons.calendar_month, color: Colors.white),
        label: const Text(
          'Reservasi Sekarang',
          style: TextStyle(color: Colors.white),
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.centerFloat,

      body: CustomScrollView(
        slivers: [
          // ==============================
          // GAMBAR DAN APPBAR
          // ==============================
          SliverAppBar(
            expandedHeight: 260,
            pinned: true,
            backgroundColor: Colors.green,
            leading: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.arrow_back),
            ),
            title: const Text(
              'La Brasserie Bistro',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Bagikan restoran'),
                    ),
                  );
                },
                icon: const Icon(Icons.share),
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                'https://images.unsplash.com/photo-1517248135467-4c7edcad34c4',
                fit: BoxFit.cover,
              ),
            ),
          ),

          // ==============================
          // ISI HALAMAN
          // ==============================
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  // Nama restoran
                  const Text(
                    'La Brasserie Bistro',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  // Rating dan kategori
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 22,
                      ),
                      const SizedBox(width: 5),
                      const Text(
                        '4.8',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(width: 5),
                      const Text(
                        '(1250 Ulasan)',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.green.shade50,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Text(
                          'Western • Bistro',
                          style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  // Alamat
                  const Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: Colors.grey,
                      ),
                      SizedBox(width: 5),
                      Expanded(
                        child: Text(
                          'Jl. Kemang Raya No.45, Jakarta Selatan',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // ==============================
                  // STATISTIK
                  // ==============================
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 18,
                      horizontal: 10,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.15),
                          blurRadius: 10,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        _statistik(
                          Icons.navigation,
                          '2.5 km',
                          'Jarak',
                        ),
                        _garisPemisah(),
                        _statistik(
                          Icons.access_time,
                          '10.00 - 22.00',
                          'Waktu Buka',
                        ),
                        _garisPemisah(),
                        _statistik(
                          Icons.payments,
                          'Rp 100.000',
                          'Harga Rata-rata',
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  // ==============================
                  // DESKRIPSI
                  // ==============================
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade50,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: const Text(
                      'La Brasserie Bistro menghadirkan pengalaman bersantap '
                      'dengan cita rasa khas Eropa dalam suasana yang hangat '
                      'dan elegan. Nikmati berbagai pilihan hidangan dan '
                      'racikan chef berpengalaman untuk setiap hidangan '
                      'istimewa.',
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        height: 1.5,
                        color: Colors.black87,
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  const Text(
                    'Selengkapnya ˅',
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 25),

                  // ==============================
                  // MENU POPULER
                  // ==============================
                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Menu Populer',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Lihat Semua ›',
                          style: TextStyle(
                            color: Colors.green,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),

                  // Card menu menggunakan Row
                  Row(
                    children: [
                      Expanded(
                        child: _menuCard(
                          'Grilled Sirloin Steak',
                          'Rp 145.000',
                          'https://images.unsplash.com/photo-1544025162-d76694265947',
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: _menuCard(
                          'Truffle Carbonara',
                          'Rp 98.000',
                          'https://images.unsplash.com/photo-1473093295043-cdd812d0e601',
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: _menuCard(
                          'Grilled Salmon',
                          'Rp 128.000',
                          'https://images.unsplash.com/photo-1467003909585-2f8a72700288',
                        ),
                      ),
                    ],
                  ),

                  // Memberikan ruang agar tidak tertutup tombol
                  const SizedBox(height: 100),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // =====================================
  // WIDGET STATISTIK
  // =====================================

  static Widget _statistik(
    IconData icon,
    String nilai,
    String label,
  ) {
    return Expanded(
      child: Column(
        children: [
          Icon(
            icon,
            color: Colors.green,
            size: 25,
          ),
          const SizedBox(height: 7),
          Text(
            nilai,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 11,
            ),
          ),
        ],
      ),
    );
  }

  // =====================================
  // GARIS PEMISAH STATISTIK
  // =====================================

  static Widget _garisPemisah() {
    return Container(
      height: 50,
      width: 1,
      color: Colors.grey.shade300,
    );
  }

  // =====================================
  // CARD MENU
  // =====================================

  static Widget _menuCard(
    String nama,
    String harga,
    String gambar,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            blurRadius: 8,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Stack = gambar + tombol favorit
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                child: Image.network(
                  gambar,
                  height: 100,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),

              Positioned(
                right: 7,
                top: 7,
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.favorite_border,
                    size: 17,
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(
                  nama,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 7),

                Text(
                  harga,
                  style: const TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}