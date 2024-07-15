import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class ParkArea extends StatefulWidget {
  const ParkArea(
      {super.key,
      required this.title,
      required this.isSelected,
      required this.onTap});
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  State<ParkArea> createState() => _ParkAreaState();
}

class _ParkAreaState extends State<ParkArea> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        width: 140,
        height: 110,
        decoration: BoxDecoration(
          color: widget.isSelected ? Colors.red : const Color(0xffE4E8F1),
          borderRadius: BorderRadius.circular(16),
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
