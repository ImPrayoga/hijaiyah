import 'package:flutter/material.dart';
import 'package:hijaiyah/page/menupage.dart'; 

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

   
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200), 
    );

    
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.2).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut, 
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 163, 11, 49), 
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
           
            Text(
              'Selamat Datang',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.yellow,
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
            const SizedBox(height: 12),
            Text(
              'Mari Mengenal\nHuruf Hijaiyah',
              style: TextStyle(
                fontSize: 30,
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
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            Text(
              'berbasis\nAugmented Reality',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.yellow,
                fontFamily: 'Chewy', 
                shadows: [
                  Shadow(
                    blurRadius: 10.0,
                    color: Colors.black.withOpacity(0.5),
                    offset: Offset(2.0, 2.0),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
           
            _buildCustomButton(
              onPressed: () {},
              imagePath: 'assets/button/scan_button.png', 
              buttonSize: 150, 
            ),
            
            Transform.translate(
              offset: Offset(0, -30), 
              child: _buildCustomButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MenuPage()),
                  );
                },
                imagePath: 'assets/button/starts_button.png', 
                buttonSize: 165, 
              ),
            ),
          ],
        ),
      ),
    );
  }

 
  Widget _buildCustomButton({
    required VoidCallback onPressed,
    required String imagePath,
    required double buttonSize, 
  }) {
    return GestureDetector(
      onTapDown: (_) {
        
        _animationController.forward();
      },
      onTapUp: (_) {
     
        _animationController.reverse();
      },
      onTapCancel: () {
        
        _animationController.reverse();
      },
      child: AnimatedBuilder(
        animation: _scaleAnimation,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value, 
            child: ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                padding: EdgeInsets.zero, 
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(35),
                ),
                elevation: 0, 
                shadowColor: Colors.transparent, 
              ),
              child: Image.asset(
                imagePath, 
                width: buttonSize, 
                height: buttonSize, 
              ),
            ),
          );
        },
      ),
    );
  }
}
