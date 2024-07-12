import 'package:flutter/material.dart';
import 'package:parking_app/screens/scanner_screen.dart';

import '../widgets/navBar.dart';
import 'controle_screen.dart';

class ManagerScreen extends StatefulWidget {
  const ManagerScreen({super.key});

  @override
  State<ManagerScreen> createState() => _ManagerScreenState();
}

class _ManagerScreenState extends State<ManagerScreen> {
  int selectedIndex = 0;

  void updateSelectedIndex(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  void update() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xffF9F9F9),
      body: Stack(
        children: [
          Offstage(
            offstage: selectedIndex != 0,
            child: const ControlPage(),
          ),
          Offstage(
            offstage: selectedIndex != 1,
            child: ScannerPage(updateParent: update),
          ),
        ],
      ),
      bottomNavigationBar: Material(
        elevation: 10,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(25)),
        child: Container(
          height: screenSize.height * 0.122,
          width: screenSize.width * 0.9,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(25),
            ),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 20,
              ),
              child: NavBar(
                updateParent: updateSelectedIndex,
                selectedIcon: selectedIndex,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
