import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:parking_app/User/ticket_screen.dart';
import 'package:parking_app/widgets/Custom_road_design.dart';
import 'package:parking_app/widgets/custom_area.dart';
import 'package:parking_app/widgets/custom_button.dart';

import '../helper/constants.dart';
import '../helper/snackBar.dart';

class ParkScreen extends StatefulWidget {
  const ParkScreen({super.key});

  @override
  State<ParkScreen> createState() => _ParkScreenState();
}

class _ParkScreenState extends State<ParkScreen> {
  String? selectedSpot;

  void selectSpot(String spot) {
    setState(() {
      selectedSpot = spot;
    });
  }

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
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ParkArea(
                        title: 'A 01',
                        isSelected: selectedSpot == 'A 01',
                        onTap: () => selectSpot('A 01'),
                      ),
                      const CustomRoad(),
                      ParkArea(
                        title: 'A 02',
                        isSelected: selectedSpot == 'A 02',
                        onTap: () => selectSpot('A 02'),
                      ),
                      const CustomRoad(),
                      ParkArea(
                        title: 'A 03',
                        isSelected: selectedSpot == 'A 03',
                        onTap: () => selectSpot('A 03'),
                      ),
                      const CustomRoad(),
                      ParkArea(
                        title: 'A 04',
                        isSelected: selectedSpot == 'A 04',
                        onTap: () => selectSpot('A 04'),
                      ),
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
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ParkArea(
                        title: 'A 05',
                        isSelected: selectedSpot == 'A 05',
                        onTap: () => selectSpot('A 05'),
                      ),
                      const CustomRoad(),
                      ParkArea(
                        title: 'A 06',
                        isSelected: selectedSpot == 'A 06',
                        onTap: () => selectSpot('A 06'),
                      ),
                      const CustomRoad(),
                      ParkArea(
                        title: 'A 07',
                        isSelected: selectedSpot == 'A 07',
                        onTap: () => selectSpot('A 07'),
                      ),
                      const CustomRoad(),
                      ParkArea(
                        title: 'A 08',
                        isSelected: selectedSpot == 'A 08',
                        onTap: () => selectSpot('A 08'),
                      ),
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
            CustomButton(
                title: 'View Parking Ticket',
                onTap: () async {
                  await userDoc
                      .update({'parking_spot': selectedSpot})
                      .then(
                        (value) => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const TicketScreen(),
                          ),
                        ),
                      )
                      .catchError(
                        (error) => showSnackBar(context, 'Failed'),
                      );
                }),
          ],
        ),
      ),
    );
  }
}
