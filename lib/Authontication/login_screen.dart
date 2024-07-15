import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:parking_app/User/home_screen.dart';
import 'package:parking_app/Manager/manager_screen.dart';
import 'package:parking_app/Authontication/register_screen.dart';
import '../helper/constants.dart';
import '../helper/snackBar.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? email;
  String? password;
  bool isLoading = false;
  GlobalKey<FormState> formKey = GlobalKey();
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
                  image: AssetImage('images/loginPic.jpeg'),
                  height: 300,
                  width: 100,
                ),
                const SizedBox(
                  height: 5,
                ),
                Center(
                  child: Text(
                    'Welcome Back!',
                    style: GoogleFonts.aBeeZee(
                      textStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Center(
                  child: Text(
                    'Please Sign In Your Account.',
                    style: GoogleFonts.aBeeZee(
                      textStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomTextField(
                  onChanged: (data) {
                    email = data;
                  },
                  isObscure: false,
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
                  isObscure: isObscure,
                  title: 'Password',
                  prefixIcon:
                      isObscure ? Icons.visibility_off : Icons.visibility,
                  controller: passwordController,
                  onPressed: () {
                    setState(() {
                      isObscure = !isObscure;
                    });
                  },
                  icon: Icons.password,
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
                        final userCredential = await FirebaseAuth.instance
                            .signInWithEmailAndPassword(
                          email: email!,
                          password: password!,
                        );
                        if (email!.contains('admin')) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ManagerScreen(),
                            ),
                          );
                        } else {
                          ID = userCredential.user!.uid;
                          userDoc = FirebaseFirestore.instance
                              .collection('users')
                              .doc(ID);
                          await userDoc.set({
                            'email': email,
                          });
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomeScreen(),
                            ),
                          );
                        }
                        showSnackBar(context, 'Signed in Successfully');
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'user-not-found') {
                          showSnackBar(
                              context, 'No user found for that email.');
                        } else if (e.code == 'wrong-password') {
                          showSnackBar(context,
                              'Wrong password provided for that user.');
                        }
                      } catch (e) {
                        showSnackBar(context, 'There Was An Error');
                      }
                      isLoading = false;
                      setState(() {
                        emailController.clear();
                        passwordController.clear();
                      });
                    }
                  },
                  title: 'Sign In',
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Dont have an account ?',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RegisterScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        ' Sign Up ',
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
  //
  // Future<void> loginUser() async {
  //   final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
  //     email: email!,
  //     password: password!,
  //   );
  // }
}
