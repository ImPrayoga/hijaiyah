import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final String letter;
  final String name;

  const DetailPage({super.key, required this.letter, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 163, 11, 49), 
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            
            IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white, size: 30),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            const SizedBox(height: 20),
           
            Text(
              letter,
              style: TextStyle(
                fontSize: 100,
                fontWeight: FontWeight.bold,
                color: Colors.yellow,
              ),
            ),
            const SizedBox(height: 20),
           
            Text(
              name,
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 40),
           
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildButtonWithHarakat(harakat: 'َ', onPressed: () {}),
                const SizedBox(width: 20),
                _buildButtonWithHarakat(harakat: 'ُ', onPressed: () {}),
                const SizedBox(width: 20),
                _buildButtonWithHarakat(harakat: 'ِ', onPressed: () {}),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildButtonWithHarakat(harakat: 'ً', onPressed: () {}),
                const SizedBox(width: 20),
                _buildButtonWithHarakat(harakat: 'ٌ', onPressed: () {}),
                const SizedBox(width: 20),
                _buildButtonWithHarakat(harakat: 'ٍ', onPressed: () {}),
              ],
            ),
            const SizedBox(height: 40),
           
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildButtonWithIcon(
                    icon: Icons.volume_up, label: 'Baca', onPressed: () {}),
                const SizedBox(width: 20),
                _buildButtonWithIcon(
                    icon: Icons.create, label: 'Tulis', onPressed: () {}),
              ],
            ),
            const SizedBox(height: 40),
          
            IconButton(
              icon: const Icon(Icons.camera_alt, color: Colors.white, size: 40),
              onPressed: () {
               
                print('Tombol Kamera ditekan');
              },
            ),
          ],
        ),
      ),
    );
  }

 
  Widget _buildButtonWithHarakat({
    required String harakat,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black, 
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8), 
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12), 
        ),
        elevation: 5, 
        shadowColor: Colors.black.withOpacity(0.3), 
        textStyle: TextStyle(fontSize: 18),
      ),
      child: Text(
        harakat,
        style: TextStyle(fontSize: 50),
      ),
    );
  }

 
  Widget _buildButtonWithIcon({
    required IconData icon,
    required String label,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, color: Colors.white),
      label: Text(label, style: TextStyle(color: Colors.white)),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue, 
        foregroundColor: Colors.white, 
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(35), 
        ),
        elevation: 10,
        shadowColor: Colors.black.withOpacity(0.3), 
        textStyle: TextStyle(fontSize: 18),
        side: BorderSide(
          width: 2,
          color: Colors.white.withOpacity(0.8), 
        ),
      ),
    );
  }
}
