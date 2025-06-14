import 'dart:math';
import 'dart:ui'; 
import 'package:flutter/material.dart';
import 'package:hijaiyah/page/detailpage.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 163, 11, 49), 
      body: SingleChildScrollView( 
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
            
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
              
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(), 
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: _getCrossAxisCount(context), 
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10, 
                  childAspectRatio: 0.75, 
                ),
                itemCount: 15, 
                itemBuilder: (context, index) {
                  return _buildMenuItem(index, context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  int _getCrossAxisCount(BuildContext context) {
    // Menghitung jumlah kolom berdasarkan orientasi layar
    var orientation = MediaQuery.of(context).orientation;
    if (orientation == Orientation.landscape) {
      return 6; 
    } else {
      return 3; 
    }
  }

  Widget _buildMenuItem(int index, BuildContext context) {
    // Array data untuk arabnya
    List<Map<String, String>> letters = [
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
    ];

    var letter = letters[index]; 

    
    if (letter['letter'] == null || letter['name'] == null) {
      print('Error: Letter or name is null');
      return Container(); 
    }

    return GestureDetector(
      onTap: () {
 
        print('Tapped on letter: ${letter['letter']} with name: ${letter['name']}');

        
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

  // perpaduan warna
  Color _getRandomLightColor() {
    Random random = Random();
   
    return Color.fromARGB(
      255,
      random.nextInt(128) + 127, 
      random.nextInt(128) + 127,
      random.nextInt(128) + 127, 
    );
  }
}
