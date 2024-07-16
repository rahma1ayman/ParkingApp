import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:parking_app/Manager/scanner.dart';
import 'package:parking_app/helper/constants.dart';

class ScannerPage extends StatelessWidget {
  ScannerPage({super.key, required this.updateParent});
  void Function() updateParent;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Text(
          'Scanner',
          style: GoogleFonts.aBeeZee(
            textStyle: const TextStyle(
              color: Colors.black,
              fontSize: 26,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Image(image: AssetImage('images/scannerPic.jpeg')),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(primaryColor),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 12),
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ScannerView(),
                  ));
            },
            child: Text(
              'Scan',
              style: GoogleFonts.aBeeZee(
                textStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
