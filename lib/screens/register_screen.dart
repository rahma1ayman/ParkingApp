import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:parking_app/helper/constants.dart';
import 'package:parking_app/screens/home_screen.dart';
import '../helper/snackBar.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String? email;

  String? password;

  bool isLoading = false;

  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController userController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                const SizedBox(
                  height: 40,
                ),
                const Image(
                  image: AssetImage('images/registerPic (1).jpeg'),
                  height: 300,
                  width: 100,
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  'Create Your Account.',
                  style: GoogleFonts.aBeeZee(
                    textStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                CustomTextField(
                  title: 'Username',
                  icon: Icons.person,
                  controller: userController,
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomTextField(
                  onChanged: (data) {
                    email = data;
                  },
                  title: 'Email',
                  icon: Icons.email,
                  controller: emailController,
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomTextField(
                  onChanged: (data) {
                    password = data;
                  },
                  title: 'Password',
                  icon: Icons.password,
                  controller: passwordController,
                ),
                const SizedBox(
                  height: 35,
                ),
                CustomButton(
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      isLoading = true;
                      setState(() {});
                      try {
                        await registerUser();
                        showSnackBar(context, 'Signed Up Successfully');
                        await users.add({
                          'email': email,
                        });
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomeScreen(),
                          ),
                        );
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'weak-password') {
                          showSnackBar(context, 'Weak Password');
                        } else if (e.code == 'email-already-in-use') {
                          showSnackBar(context, 'Email Already Used');
                        }
                      } catch (e) {
                        showSnackBar(context, 'There Was An Error');
                      }
                      isLoading = false;
                      setState(() {
                        userController.clear();
                        emailController.clear();
                        passwordController.clear();
                      });
                    }
                  },
                  title: 'Sign Up',
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Already have an account ?',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        ' Sign In ',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> registerUser() async {
    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email!, password: password!);
  }
}
