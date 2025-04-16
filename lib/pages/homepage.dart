import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFAC263E),
        title: const Text(
          'RSVP',
          style: TextStyle(
            fontFamily: 'Moldyen',
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {},
          ),
        ],
      ),
      body: Stack(
        children: [
          // Background Image
          Container(
            height: double.infinity, // Full screen height
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/bg.jpg'), // Placeholder
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
                  Colors.white, // Bottom: Slightly faded
                ],
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

                // Icons Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      padding: EdgeInsets.zero,
                      ),
                      child: _buildIconWithLabel(Icons.upload, 'Upload'),
                    ),
                    SizedBox(width: 20), // Adjust spacing between icons
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      padding: EdgeInsets.zero,
                      ),
                      child: _buildIconWithLabel(Icons.chat, 'Chat'),
                    ),
                    SizedBox(width: 20),
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      padding: EdgeInsets.zero,
                      ),
                      child: _buildIconWithLabel(Icons.event, 'Planning'),
                    ),
                    SizedBox(width: 20),
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      padding: EdgeInsets.zero,
                      ),
                      child: _buildIconWithLabel(Icons.people, 'RSVP'),
                    ),
                  ],
                ),
                SizedBox(height: 20), // Adjust spacing between icons and carousel

                // Carousel Section
                CarouselSlider(
                  options: CarouselOptions(
                    viewportFraction: 0.5,
                    height: 325,
                    autoPlay: true,
                    enlargeCenterPage: true,
                  ),
                  items: [
                    'assets/1.jpg',
                    'assets/2.jpg',
                    'assets/3.jpg',
                    'assets/4.jpg',
                    'assets/5.jpg',
                    'assets/6.jpg',
                    'assets/7.jpg',
                    'assets/8.jpg',
                  ].map((imagePath) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(imagePath),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
                SizedBox(height: 20), // Adjust spacing between carousel and button

                // Button Section
                ElevatedButton(
                  onPressed: () {},
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

  Widget _buildIconWithLabel(IconData icon, String label) {
    return Column(
      children: [
        Icon(icon, color: Color(0XFFAC263E), size: 30),
        SizedBox(height: 5),
        Text(
          label,
          style: TextStyle(
            fontFamily: 'Montserrat',
            color: Color(0xFFAC263E),
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}