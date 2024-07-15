import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:parking_app/helper/load_data.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../GenerateScreen.dart';
import '../helper/constants.dart';

class TicketScreen extends StatelessWidget {
  const TicketScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   title: Text(
      //     'Parking Ticket',
      //     style: GoogleFonts.aBeeZee(
      //       textStyle: const TextStyle(
      //         color: Colors.black,
      //         fontSize: 26,
      //         fontWeight: FontWeight.w600,
      //       ),
      //     ),
      //   ),
      //   centerTitle: true,
      // ),
      body: GenerateScreen(),
      // body: Column(
      //   children: [
      //     // QrImageView(
      //     //   data: qrData,
      //     //   version: QrVersions.auto,
      //     //   size: 200,
      //     // ),
      //     const GenerateScreen(),
      //     //loadData(users),
      //   ],
      // ),
    );
  }
}
