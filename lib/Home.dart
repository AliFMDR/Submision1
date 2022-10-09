import 'package:flutter/material.dart';
import 'package:projek2/RestaurantSearchPage.dart';
import 'package:projek2/RestaurantListPage.dart';
import 'package:projek2/bookmarkPage.dart';
import 'package:projek2/settingPage.dart';

class RestaurantHomePage extends StatefulWidget {
  const RestaurantHomePage({Key? key}) : super(key: key);

  @override
  State<RestaurantHomePage> createState() => _RestaurantHomePageState();
}

class _RestaurantHomePageState extends State<RestaurantHomePage> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    const RestaurantListPage(),
    const BookmarkPage(),
    const SettingsPage(),
    const RestaurantSearchPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  //BIKIN CUSTOM APPBAR
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 104, 165, 252),
        title: Text('Restaurant'),
      ),
      backgroundColor: Colors.grey.shade50,
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.home)),
        BottomNavigationBarItem(label: 'favorite', icon: Icon(Icons.favorite)),
        BottomNavigationBarItem(label: 'Settings', icon: Icon(Icons.settings)),
        BottomNavigationBarItem(label: 'Search', icon: Icon(Icons.search))
      ],
      onTap: (index) {
        _onItemTapped(index);
      },
    );
  }
}
