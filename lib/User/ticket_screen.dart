import 'package:flutter/material.dart';
import 'package:parking_app/helper/load_data.dart';
import 'GenerateScreen.dart';
import '../helper/constants.dart';

class TicketScreen extends StatelessWidget {
  const TicketScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(
            width: 500,
            height: 500,
            child: GenerateQR(),
          ),
          loadData(users, ID),
        ],
      ),
    );
  }
}
