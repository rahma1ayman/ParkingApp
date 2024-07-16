import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:parking_app/helper/constants.dart'; // Assuming this holds your ID
import 'package:qr_flutter/qr_flutter.dart';

class GenerateQR extends StatefulWidget {
  const GenerateQR({super.key});

  @override
  State<GenerateQR> createState() => _GenerateQRState();
}

class _GenerateQRState extends State<GenerateQR> {
  final GlobalKey globalKey = GlobalKey();
  String data = ''; // Assuming ID is defined in constants.dart

  @override
  void initState() {
    super.initState();
    // Generate QR code on initialization
    generateQR();
  }

  @override
  Widget build(BuildContext context) {
    final bodyHeight = MediaQuery.of(context).size.height -
        MediaQuery.of(context).viewInsets.bottom;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Parking Ticket',
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
      body: Container(
        color: Colors.white,
        child: Padding(
          padding:
              const EdgeInsets.only(top: 50, left: 20, right: 10, bottom: 20),
          child: Center(
            child: RepaintBoundary(
              key: globalKey,
              child: Container(
                color: Colors.white,
                child: QrImageView(
                  data: data,
                  size: 300,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void generateQR() {
    // Update state with the ID from constants.dart
    setState(() {
      data = ID;
    });
  }
}
