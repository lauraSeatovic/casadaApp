import 'package:casada/orders/screens/orders_screen.dart';
import 'package:casada/products/screens/products.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final customPrimaryColor = MaterialColor(
      0xFFB00041,
      <int, Color>{
        50: Color(0xFFFCE4EC),
        100: Color(0xFFF8BBD0),
        200: Color(0xFFF48FB1),
        300: Color(0xFFF06292),
        400: Color(0xFFEC407A),
        500: Color(0xFFE91E63),
        600: Color(0xFFD81B60),
        700: Color(0xFFC2185B),
        800: Color(0xFFAD1457),
        900: Color(0xFF880E4F),
      },
    );
    return MaterialApp(
      theme: ThemeData(
        primarySwatch:
            customPrimaryColor, // Change the primary color to deep purple
      ),
      title: "My App",
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    Products(),
    OrdersScreen(),
  ];

  Widget _getPage(int index) {
    return _pages[index];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Casada'),
      ),
      body: Row(
        children: [
          
          NavigationRail(
            selectedIndex: _selectedIndex,
            onDestinationSelected: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            labelType: NavigationRailLabelType.all,
            destinations: const [
              /*
              NavigationRailDestination(
                icon: Icon(Icons.person),
                label: Text('Korisnici'),
              ),*/
              NavigationRailDestination(
                icon: Icon(Icons.local_mall),
                label: Text('Proizvodi'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.list),
                label: Text('Narudžbe'),
              ),
            ],
          ),
          Expanded(
            child: Center(
              child: _getPage(_selectedIndex),
            ),
          ),
        ],
      ),
    );
  }
}
