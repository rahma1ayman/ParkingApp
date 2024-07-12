import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:parking_app/widgets/Custom_road_design.dart';
import 'package:parking_app/widgets/custom_area.dart';
import 'package:parking_app/widgets/custom_button.dart';

class ParkScreen extends StatelessWidget {
  const ParkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Select Parking Spot',
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: 710,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ParkArea(title: 'A 01'),
                      CustomRoad(),
                      ParkArea(title: 'A 02'),
                      CustomRoad(),
                      ParkArea(title: 'A 03'),
                      CustomRoad(),
                      ParkArea(title: 'A 04'),
                    ],
                  ),
                  SizedBox(
                    width: 20,
                    child: Stack(
                      children: [
                        Container(
                          height: double.infinity,
                          width: 20,
                          color: Colors.black,
                        ),
                        const Center(
                          child: Dash(
                            direction: Axis.vertical,
                            dashColor: Colors.white,
                            length: 710,
                            dashThickness: 2,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ParkArea(title: 'A 05'),
                      CustomRoad(),
                      ParkArea(title: 'A 06'),
                      CustomRoad(),
                      ParkArea(title: 'A 07'),
                      CustomRoad(),
                      ParkArea(title: 'A 08'),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 500,
              height: 20,
              child: Stack(
                children: [
                  Container(
                    height: 20,
                    width: 500,
                    color: Colors.black,
                  ),
                  const Center(
                    child: Dash(
                      direction: Axis.horizontal,
                      dashColor: Colors.white,
                      length: 390,
                      dashThickness: 2,
                    ),
                  )
                ],
              ),
            ),
            CustomButton(title: 'Continue'),
          ],
        ),
      ),
    );
  }
}
