import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:parking_app/helper/snackBar.dart';
import 'constants.dart';

FutureBuilder<DocumentSnapshot<Object?>> loadData(
    CollectionReference<Object?> users, String id) {
  return FutureBuilder<DocumentSnapshot>(
    future: users.doc(id).get(),
    builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
      if (snapshot.hasError) {
        showSnackBar(context, 'Something Error');
      }

      if (snapshot.hasData && !snapshot.data!.exists) {
        showSnackBar(context, 'Data not found');
      }

      if (snapshot.connectionState == ConnectionState.done) {
        Map<String, dynamic> data =
            snapshot.data!.data() as Map<String, dynamic>;
        qrData = '''
          Full Name: ${data['full_name']}
          Phone Number: ${data['phone_number']}
          Vehicle Number: ${data['vehicle_number']}
          Parking Spot :${data['parking_spot']}
        ''';

        return Column(
          children: [
            ListTile(
              title: const Text(
                'Full Name:',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              trailing: Text(
                '${data['full_name']}',
                style: const TextStyle(
                    color: Colors.black45,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
            ),
            ListTile(
              title: const Text(
                'Phone Number:',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              trailing: Text(
                '${data['phone_number']}',
                style: const TextStyle(
                    color: Colors.black45,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
            ),
            ListTile(
              title: const Text(
                'Vehicle Number:',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              trailing: Text(
                '${data['vehicle_number']}',
                style: const TextStyle(
                    color: Colors.black45,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
            ),
            ListTile(
              title: const Text(
                'Parking Spot:',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              trailing: Text(
                '${data['parking_spot']}',
                style: const TextStyle(
                    color: Colors.black45,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ],
        );
      }
      return const SizedBox(
        width: 50,
        height: 50,
        child: CircularProgressIndicator(),
      );
    },
  );
}
