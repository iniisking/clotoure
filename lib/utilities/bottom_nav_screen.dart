import 'package:cloture/gen/assets.gen.dart';
import 'package:cloture/screens/home/home_page..dart';
import 'package:cloture/screens/notifications/notifications_screen.dart';
import 'package:cloture/screens/orders/orders_screen.dart';
import 'package:cloture/screens/profile/profile_screen.dart';
import 'package:cloture/utilities/colors.dart';
import 'package:flutter/material.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  // This will keep track of the selected index for the BottomNavigationBar
  int _selectedIndex = 0;

  // List of screens for different tabs
  static const List<Widget> _screens = <Widget>[
    HomePage(),
    NotificationsScreen(),
    OrdersScreen(),
    ProfileScreen(),
  ];

  // Function to handle navigation bar item taps
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex], // Display the selected screen
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: white100,
        elevation: 0.0,
        items: [
          BottomNavigationBarItem(
            backgroundColor: white100,
            icon: Assets.images.home.image(
              height: 30,
              color: _selectedIndex == 0
                  ? primary200
                  : black50, // Change color based on selection
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            backgroundColor: white100,
            icon: Assets.images.notification.image(
              height: 30,
              color: _selectedIndex == 1
                  ? primary200
                  : black50, // Change color based on selection
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            backgroundColor: white100,
            icon: Assets.images.order.image(
              height: 30,
              color: _selectedIndex == 2
                  ? primary200
                  : black50, // Change color based on selection
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            backgroundColor: white100,
            icon: Assets.images.profile.image(
              height: 30,
              color: _selectedIndex == 3
                  ? primary200
                  : black50, // Change color based on selection
            ),
            label: '',
          ),
        ],
        selectedItemColor:
            primary200, // You can still keep this for the default selected color
        unselectedItemColor:
            black50, // You can still keep this for the default unselected color
        onTap: _onItemTapped, // Change tabs when tapped
      ),
    );
  }
}
