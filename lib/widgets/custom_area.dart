import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class ParkArea extends StatefulWidget {
  const ParkArea({super.key, required this.title});
  final String title;

  @override
  State<ParkArea> createState() => _ParkAreaState();
}

class _ParkAreaState extends State<ParkArea> {
  @override
  Widget build(BuildContext context) {
    bool selected = false;
    return GestureDetector(
      onTap: () {
        selected = true;
        setState(() {});
      },
      child: Container(
        width: 140,
        height: 110,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: selected == true ? Colors.red : const Color(0xffE4E8F1),
        ),
        child: Center(
          child: Text(
            widget.title,
            style: GoogleFonts.aBeeZee(
              textStyle: const TextStyle(
                color: Colors.black,
                fontSize: 25,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
