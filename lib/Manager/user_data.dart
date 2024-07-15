import 'package:flutter/material.dart';
import 'package:parking_app/helper/load_data.dart';

import '../helper/constants.dart';

class UserDataConfirmation extends StatelessWidget {
  const UserDataConfirmation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Data'),
      ),
      body: loadData(users),
    );
  }
}
