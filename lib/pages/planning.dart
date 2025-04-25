import 'package:flutter/material.dart';
import 'package:rsvp/main.dart'; // Assuming this is where your MainScreen class is

class PlanningPage extends StatelessWidget {
  const PlanningPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFAA1E36),
        title: const Text(
          'RSVP',
          style: TextStyle(
            fontFamily: 'Moldyen',
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(
                context); // This will navigate back to the previous screen
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {
              Navigator.pushNamed(context, '/search');
            },
          ),
          IconButton(
            icon: const Icon(Icons.menu, color: Colors.white),
            onPressed: () {
              Navigator.pushNamed(context, '/menu');
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          // Background Image
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/wedcouple.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Gradient Overlay
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.white,
                ],
                stops: [0.2, 1.0],
              ),
            ),
          ),
          // Content Column
          SingleChildScrollView(
            child: Column(
              children: [
                // Centered Text
                const SizedBox(height: 40),
                const Text(
                  'IVY & MATT',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFAA1E36),
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'WEDDING',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFFAA1E36),
                  ),
                ),
                const SizedBox(height: 40), // Space between text and cards

                // Cards Grid
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                    ),
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      final events = [
                        {
                          'time': '3:00 PM',
                          'title': 'Ceremony',
                          'location': 'Garden Pavilion',
                          'description': 'Join us as we exchange vows in the beautiful garden pavilion.',
                        },
                        {
                          'time': '4:30 PM',
                          'title': 'Cocktail Hour',
                          'location': 'Terrace',
                          'description': 'Enjoy drinks and hors d\'oeuvres while we take photos.',
                        },
                        {
                          'time': '6:00 PM',
                          'title': 'Reception',
                          'location': 'Grand Ballroom',
                          'description': 'Dinner, dancing, and celebration!',
                        },
                        {
                          'time': '10:00 PM',
                          'title': 'After Party',
                          'location': 'Lounge',
                          'description': 'Continue the celebration with late-night snacks and drinks.',
                        },
                      ];
                      return _buildEventCard(
                        time: events[index]['time']!,
                        title: events[index]['title']!,
                        location: events[index]['location']!,
                        description: events[index]['description']!,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEventCard({
    required String time,
    required String title,
    required String location,
    required String description,
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontFamily: 'Montserrat-bold',
                fontSize: 20,
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              time,
              style: const TextStyle(
                fontFamily: 'Montserrat-bold',
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Color(0xFFAA1E36),
              ),
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                const Icon(
                  Icons.location_on,
                  size: 16,
                  color: Colors.grey,
                ),
                const SizedBox(width: 4),
                Text(
                  location,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Expanded(
              child: Text(
                description,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.black87,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
