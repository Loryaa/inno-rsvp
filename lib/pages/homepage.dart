import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatelessWidget {
  final Function(int)? onNavigate;

  const HomePage({Key? key, this.onNavigate}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            height: double.infinity, // Full screen height
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/wedcouple.jpg'), // Placeholder
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Gradient Overlay
            Container(
            height: double.infinity, // Full screen height
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent, // Top: Transparent
                Colors.white, // Bottom: More white (80% opacity)
              ],
              stops: [0.2, 1.0], // Adjust the gradient to make white cover 80%
              ),
            ),
            ),
          // Fixed Content Layout
          Padding(
            padding: const EdgeInsets.only(top: 125), // Move contents 100px down
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Text Overlay
                Text(
                  'IVY & MATT',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFAC263E),
                  ),
                ),
                SizedBox(height: 10), // Adjust spacing between text and icons

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildNavItem(Icons.upload_outlined, 'Upload', 1, context),
                      _buildNavItem(Icons.calendar_today_outlined, 'Planning', 2, context),
                      _buildNavItem(Icons.people_outline, 'Us', 3, context),
                    ],
                  ),
                ),

                // Carousel Section
                CarouselSlider(
                  options: CarouselOptions(
                    viewportFraction: 0.5,
                    height: 325,
                    autoPlay: true,
                    enlargeCenterPage: true,
                  ),
                  items: [
                    'assets/wedcouple2.jpg',
                    'assets/wedcouple3.jpg',
                    'assets/wedcouple4.jpg',
                    'assets/wedcouple5.jpg',
                    'assets/wedcouple6.jpg',
                    'assets/wedcouple7.jpg',
                    'assets/wedcouple8.jpg',
                    'assets/wedcouple9.jpg',
                    'assets/wedcouple10.jpg',
                  ].map((imagePath) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          '/stories',
                          arguments: {'imagePath': imagePath},
                        );
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          imagePath,
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(height: 20), // Adjust spacing between carousel and button

                // Button Section
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/memories');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red[800],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  ),
                  child: Text(
                    'See all memories',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index, BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, _getRouteName(index)),
      child: Column(
        children: [
          // Icon with white circular background
          Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2), // White background
              shape: BoxShape.circle, // Circular shape
            ),
            padding: EdgeInsets.all(8.0), // Padding inside the circle
            child: Icon(icon, color: Color(0XFFAC263E), size: 30),
          ),
          SizedBox(height: 5), // Spacing between icon and label
          Text(
            label,
            style: TextStyle(
              fontFamily: 'Montserrat',
              color: Color(0xFFAC263E),
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  String _getRouteName(int index) {
    switch (index) {
      case 1:
        return '/upload';
      case 2:
        return '/planning';
      case 3:
        return '/us';
      default:
        return '/';
    }
  }
}

class StoriesPage extends StatelessWidget {
  final String imagePath;

  const StoriesPage({Key? key, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Story'),
      ),
      body: Center(
        child: Image.asset(imagePath),
      ),
    );
  }
}
