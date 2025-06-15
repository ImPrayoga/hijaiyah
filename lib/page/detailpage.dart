import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DetailPage extends StatelessWidget {
  final String letter;
  final String name;

  const DetailPage({super.key, required this.letter, required this.name});

  @override
  Widget build(BuildContext context) {
    // Lock orientation to portrait
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    // Get the screen size using MediaQuery
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 163, 11, 49),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // Tombol kembali dengan pengecekan Navigator
            IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white, size: 30),
              onPressed: () {
                if (Navigator.canPop(context)) {
                  Navigator.pop(context);
                }
              },
            ),
            const SizedBox(height: 20),

            // Menampilkan huruf Arab dengan genuine 3D effect
            Stack(
              alignment: Alignment.center,
              children: [
                // First layer: dark shadow for depth (bottom layer)
                Positioned(
                  left: 8,
                  top: 8,
                  child: Text(
                    letter,
                    style: TextStyle(
                      fontSize: screenWidth * 0.25, // Adjust font size based on screen width
                      fontWeight: FontWeight.bold,
                      color: Colors.black.withOpacity(0.5), // Shadow color
                      fontFamily: 'NotoSansArabic', // Use NotoSansArabic for Arabic text
                    ),
                  ),
                ),
                // Second layer: light shadow (middle layer)
                Positioned(
                  left: 4,
                  top: 4,
                  child: Text(
                    letter,
                    style: TextStyle(
                      fontSize: screenWidth * 0.25, // Adjust font size based on screen width
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.withOpacity(0.5), // Light shadow color
                      fontFamily: 'NotoSansArabic', // Use NotoSansArabic for Arabic text
                    ),
                  ),
                ),
                // Main layer: top text layer (the actual letter)
                Text(
                  letter,
                  style: TextStyle(
                    fontSize: screenWidth * 0.25, // Adjust font size based on screen width
                    fontWeight: FontWeight.bold,
                    color: Colors.yellow, // Main text color
                    fontFamily: 'NotoSansArabic', // Use NotoSansArabic for Arabic text
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Menampilkan nama huruf
            Text(
              name,
              style: TextStyle(
                fontSize: screenWidth * 0.08, // Adjust font size based on screen width
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontFamily: 'Chewy', // Use Chewy font for English text or name
              ),
            ),
            const SizedBox(height: 40),

            // Baris tombol Harakat
            Wrap(
              spacing: screenWidth * 0.03, // Adjust spacing between buttons
              runSpacing: screenWidth * 0.02, // Adjust vertical space
              alignment: WrapAlignment.center,
              children: [
                _buildButtonWithHarakat(harakat: 'َ', onPressed: () {}),
                _buildButtonWithHarakat(harakat: 'ُ', onPressed: () {}),
                _buildButtonWithHarakat(harakat: 'ِ', onPressed: () {}),
                _buildButtonWithHarakat(harakat: 'ً', onPressed: () {}),
                _buildButtonWithHarakat(harakat: 'ٌ', onPressed: () {}),
                _buildButtonWithHarakat(harakat: 'ٍ', onPressed: () {}),
              ],
            ),
            const SizedBox(height: 20),

            // Tombol Baca dan Tulis dengan image assets
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: _buildButtonWithImage(
                    screenWidth: screenWidth,
                    imagePath: 'assets/button/baca_button.png',
                    onPressed: () {},
                  ),
                ),
                SizedBox(width: screenWidth * 0.01), // Decreased spacing between buttons
                Expanded(
                  child: _buildButtonWithImage(
                    screenWidth: screenWidth,
                    imagePath: 'assets/button/tulis_button.png',
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Tombol Kamera dengan image asset
            IconButton(
              icon: Image.asset(
                'assets/button/camera_button.png',
                width: screenWidth * 0.25, // Adjusted size for "Kamera" button (responsive)
                height: screenWidth * 0.25, // Adjusted size for "Kamera" button (responsive)
              ),
              onPressed: () {
                print('Tombol Kamera ditekan');
              },
            ),
          ],
        ),
      ),
    );
  }

  // Membuat tombol dengan harakat
  Widget _buildButtonWithHarakat({
    required String harakat,
    required VoidCallback onPressed,
  }) {
    return Container(
      width: 60, // Smaller size for the Harakat buttons
      height: 60, // Smaller size for the Harakat buttons
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8), // Reduced padding
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 0, // Removed shadow
        ),
        child: Text(
          harakat,
          style: TextStyle(
            fontSize: 50, // Larger font size for Harakat symbols
            fontFamily: 'NotoSansArabic', // Ensure Harakat symbols use the correct font
            color: Colors.black, // Set the text color to black
          ),
        ),
      ),
    );
  }

  // Membuat tombol dengan image asset
  Widget _buildButtonWithImage({
    required double screenWidth, // Pass screenWidth as a parameter
    required String imagePath,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent, // Make the button background transparent
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10), // Adjust padding based on screen size
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 0, // Removed shadow
      ),
      child: Image.asset(
        imagePath,
        width: screenWidth * 0.4, // Adjusted size for "Baca" and "Tulis" buttons
        height: screenWidth * 0.4, // Adjusted size for "Baca" and "Tulis" buttons
      ),
    );
  }
}
