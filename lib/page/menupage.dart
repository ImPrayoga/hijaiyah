import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:hijaiyah/page/detailpage.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  // Menyimpan controller untuk PageView
  PageController _pageController = PageController();

  // Data huruf hijaiyah
  final List<Map<String, String>> letters = [
    {'letter': 'ا', 'name': 'Alif'},
    {'letter': 'ب', 'name': 'Ba'},
    {'letter': 'ت', 'name': 'Ta'},
    {'letter': 'ث', 'name': 'Tsa'},
    {'letter': 'ج', 'name': 'Jim'},
    {'letter': 'ح', 'name': 'Ha'},
    {'letter': 'خ', 'name': 'Kho'},
    {'letter': 'د', 'name': 'Dal'},
    {'letter': 'ذ', 'name': 'Dzal'},
    {'letter': 'ر', 'name': 'Ro'},
    {'letter': 'ز', 'name': 'Zai'},
    {'letter': 'س', 'name': 'Sin'},
    {'letter': 'ش', 'name': 'Syin'},
    {'letter': 'ص', 'name': 'Shod'},
    {'letter': 'ض', 'name': 'Dhod'},
    {'letter': 'ط', 'name': 'Tho'},
    {'letter': 'ظ', 'name': 'Zho'},
    {'letter': 'ع', 'name': 'Ain'},
    {'letter': 'غ', 'name': 'Gho'},
    {'letter': 'ف', 'name': 'Fa'},
    {'letter': 'ق', 'name': 'Qaf'},
    {'letter': 'ك', 'name': 'Kaf'},
    {'letter': 'ل', 'name': 'Lam'},
    {'letter': 'م', 'name': 'Mim'},
    {'letter': 'ن', 'name': 'Nun'},
    {'letter': 'ه', 'name': 'Ha'},
    {'letter': 'و', 'name': 'Waw'},
    {'letter': 'ي', 'name': 'Ya'},
  ];

  // Fungsi untuk menghasilkan warna acak
  Color _getRandomLightColor() {
    Random random = Random();
    return Color.fromARGB(
      255,
      random.nextInt(128) + 127,
      random.nextInt(128) + 127,
      random.nextInt(128) + 127,
    );
  }

  // Menampilkan item menu huruf
  Widget _buildMenuItem(int index, BuildContext context) {
    var letter = letters[index];

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(
              letter: letter['letter']!,
              name: letter['name']!,
            ),
          ),
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Stack(
          children: [
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: Container(
                  color: Colors.black.withOpacity(0.25),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: _getRandomLightColor(),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.star, color: Colors.yellow, size: 16),
                      Icon(Icons.star, color: Colors.yellow, size: 24),
                      Icon(Icons.star, color: Colors.yellow, size: 16),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    letter['letter']!,
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFamily: 'Chewy',
                      shadows: [
                        Shadow(
                          blurRadius: 10.0,
                          color: Colors.black.withOpacity(0.5),
                          offset: Offset(2.0, 2.0),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    letter['name']!,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFamily: 'Chewy',
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Menentukan jumlah halaman berdasarkan jumlah huruf
    int pageCount = (letters.length / 15).ceil();

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 163, 11, 49),
      body: Column(
        children: [
          // Header bagian atas
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(10),
                  elevation: 0,
                ),
                child: Image.asset(
                  'assets/button/arrowl_button.png',
                  width: 60,
                  height: 60,
                ),
              ),
              const Text(
                'Daftar Huruf Hijaiyah',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontFamily: 'Chewy',
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  print('Reset tombol ditekan');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(10),
                  elevation: 0,
                ),
                child: Image.asset(
                  'assets/button/reset_button.png',
                  width: 60,
                  height: 60,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // PageView untuk huruf hijaiyah (3 kolom, 5 baris)
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: pageCount,
              itemBuilder: (context, pageIndex) {
                int startIndex = pageIndex * 15;
                int endIndex = startIndex + 15;
                List<Map<String, String>> pageLetters = letters.sublist(
                    startIndex, endIndex > letters.length ? letters.length : endIndex);

                return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, // 3 kolom
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.75,
                  ),
                  itemCount: pageLetters.length,
                  itemBuilder: (context, index) {
                    return _buildMenuItem(startIndex + index, context);
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
