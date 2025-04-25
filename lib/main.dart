import 'package:flutter/material.dart';
import 'package:rsvp/pages/homepage.dart';
import 'package:rsvp/pages/memories.dart';
import 'package:rsvp/pages/stories.dart' as stories;
import 'package:rsvp/pages/upload.dart';
import 'package:rsvp/pages/planning.dart';
import 'package:rsvp/pages/about_us.dart';
import 'package:rsvp/pages/menu.dart';
import 'package:rsvp/pages/search.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wedding RSVP',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFFAA1E36),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFAA1E36),
          primary: const Color(0xFFAA1E36),
        ),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const MainScreen(initialIndex: 0),
        '/memories': (context) => const MemoriesPage(),
        '/upload': (context) => const UploadPage(),
        '/planning': (context) => const PlanningPage(),
        '/us': (context) => const UsPage(),
        '/menu': (context) => const MenuPage(),
        '/search': (context) => const SearchPage(),
      },
      // Handle dynamic routes
      onGenerateRoute: (settings) {
        if (settings.name == '/stories') {
          final args = settings.arguments as Map<String, dynamic>;
          return MaterialPageRoute(
            builder: (context) => stories.StoriesPage(
              imagePath: args['imagePath'] as String,
            ),
          );
        }
        return null;
      },
    );
  }
}

class MainScreen extends StatefulWidget {
  final int initialIndex;

  const MainScreen({Key? key, required this.initialIndex}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

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
      body: _selectedIndex == 0
          ? HomePage(onNavigate: _onItemTapped)
          : _getPage(_selectedIndex),
    );
  }

  Widget _getPage(int index) {
    switch (index) {
      case 0:
        return HomePage(onNavigate: _onItemTapped);
      case 1:
        return const UploadPage();
      case 2:
        return const PlanningPage();
      case 3:
        return const UsPage();
      default:
        return HomePage(onNavigate: _onItemTapped);
    }
  }
}
