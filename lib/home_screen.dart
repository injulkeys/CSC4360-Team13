import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:hvu/medications_widget.dart';
import 'package:hvu/message_screen.dart';
import 'package:hvu/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dropdown Navigation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      routes: {
        '/page1': (context) => ProfileScreen(),
        '/page2': (context) => MedicationList(),
        '/page3': (context) => MessageScreen(),
      },
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _selectedPage = 'Page 1';

  void _onPageSelected(String? value) {
    if(value != null){
      setState(() {
        _selectedPage = value;
    });
    Navigator.of(context).pushNamed(value);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dropdown Navigation'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Selected page:',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              _selectedPage,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 50),
            DropdownButton<String>(
              value: _selectedPage,
              onChanged: _onPageSelected,
              items: <String>[
                'Page 1',
                'Page 2',
                'Page 3',
              ].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 1'),
      ),
      body: const Center(
        child: Text(
          'This is Page 1',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 2'),
      ),
      body: const Center(
        child: Text(
          'This is Page 2',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

class Page3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 3'),
      ),
      body: const Center(
        child: Text(
          'This is Page 3',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}