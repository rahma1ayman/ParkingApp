import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  const NavBar(
      {super.key, required this.updateParent, required this.selectedIcon});

  final void Function(int) updateParent;

  final int selectedIcon;

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    int selectedIconBar = widget.selectedIcon;
    return BottomNavigationBar(
      iconSize: 30,
      elevation: 0,
      currentIndex: selectedIconBar,
      backgroundColor: Colors.white,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
      selectedFontSize: 10.0,
      unselectedFontSize: 8.0,
      showSelectedLabels: true,
      onTap: (val) {
        setState(() {
          selectedIconBar = val;
          widget.updateParent(val);
        });
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
          backgroundColor: Colors.white,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.qr_code_scanner),
          label: 'Scan',
          backgroundColor: Colors.white,
        ),
      ],
    );
  }
}
