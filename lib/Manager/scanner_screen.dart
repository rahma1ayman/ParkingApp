import 'package:flutter/material.dart';
import 'package:parking_app/Manager/scanner_page.dart';

class ScannerPage extends StatelessWidget {
  ScannerPage({super.key, required this.updateParent});
  void Function() updateParent;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scanner'),
      ),
      body: ElevatedButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ScannerView(),
              ));
        },
        child: Text('Scan'),
      ),
    );
  }
}
