import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

var primaryColor = 0xff407AFE;
var secondaryColor = 0xff53A1FA;
CollectionReference users = FirebaseFirestore.instance.collection('users');
late var userDoc;
late var ID;
String qrData = '';
bool isObscure = true;
