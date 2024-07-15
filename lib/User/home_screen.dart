import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:parking_app/User/parking_screen.dart';
import 'package:parking_app/User/ticket_screen.dart';
import 'package:parking_app/widgets/custom_button.dart';
import 'package:parking_app/widgets/custom_text_field.dart';

import '../helper/constants.dart';
import '../helper/snackBar.dart';

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
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
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
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              const Image(
                image: AssetImage('images/set_location.jpeg'),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                title: 'Full Name',
                isObscure: false,
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
                isObscure: false,
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
                isObscure: false,
                icon: Icons.car_rental,
                onChanged: (data) {
                  vehicleNumber = data;
                },
                controller: vehicleController,
              ),
              const SizedBox(
                height: 45,
              ),
              CustomButton(
                title: 'Continue',
                onTap: () async {
                  if (formKey.currentState!.validate()) {
                    userDoc =
                        FirebaseFirestore.instance.collection('users').doc(ID);
                    await userDoc
                        .update({
                          'full_name': fullName,
                          'phone_number': phoneNumber,
                          'vehicle_number': vehicleNumber,
                        })
                        .then(
                          (value) => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ParkScreen(),
                            ),
                          ),
                        )
                        .catchError(
                          (error) => showSnackBar(context, 'Failed'),
                        );
                    setState(() {
                      nameController.clear();
                      phoneController.clear();
                      vehicleController.clear();
                    });
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
