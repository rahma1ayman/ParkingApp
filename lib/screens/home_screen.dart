import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:parking_app/widgets/custom_button.dart';
import 'package:parking_app/widgets/custom_text_field.dart';

import '../helper/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late String fullName;

  late String phoneNumber;

  late String vehicleNumber;

  TextEditingController nameController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  TextEditingController vehicleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const Image(
              image: AssetImage('images/parking.jpeg'),
            ),
            CustomTextField(
              title: 'Full Name',
              icon: Icons.person,
              onChanged: (data) {
                fullName = data;
              },
              controller: nameController,
            ),
            const SizedBox(
              height: 25,
            ),
            CustomTextField(
              title: 'Phone Number',
              icon: Icons.phone,
              onChanged: (data) {
                phoneNumber = data;
              },
              controller: phoneController,
            ),
            const SizedBox(
              height: 25,
            ),
            CustomTextField(
              title: 'Vehicle Number',
              icon: Icons.car_rental,
              onChanged: (data) {
                vehicleNumber = data;
              },
              controller: vehicleController,
            ),
            const SizedBox(
              height: 25,
            ),
            CustomButton(
              title: 'Continue',
              onTap: () async {
                await users.add({
                  'full_name': fullName,
                  'phone_number': phoneNumber,
                  'vehicle_number': vehicleNumber,
                });
                setState(() {
                  nameController.clear();
                  phoneController.clear();
                  vehicleController.clear();
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
