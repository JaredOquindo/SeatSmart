/* Authored by: Jared Oquindo
Company: LuminaTech
Project: SeatSmart
Feature: [SESM-002] Login Page
  User Inputs their Email and Password to Log in the application
 */

// ignore_for_file: use_build_context_synchronously
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:seat_smart/components/my_button.dart';
import 'package:seat_smart/components/my_textfield.dart';
import 'home_page.dart';
import 'user_type.dart';
import 'package:seat_smart/components/image_banner.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;
  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();

  
}

class _LoginPageState extends State<LoginPage> {
  // text editing controllers
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  // sign user in method
  void signUserIn() async{

    // show loading circle
    showDialog(
      context: context, 
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator()
        );
      }
    );

    // try sign in
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text,
    );
      Navigator.pop(context);
      Navigator.push(
      context, 
      MaterialPageRoute(builder: (context) => HomePage()));
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      // show error message
      showErrorMessage(e.code);
    }
  }

  // error message to user
  void showErrorMessage(String message){
    showDialog(
      context: context, 
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.deepPurple,
          title: Center(
            child: Text(
              message,
              style: const TextStyle(color: Colors.white),
              ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Stack(
        children: [
          Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  
                  const ImageBanner("lib/images/SESM.png"),

                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'EMAIL:',
                          style: TextStyle(
                            color: Color(0xff503D2E),
                            fontFamily: 'Kodchasan',
                            fontWeight: FontWeight.bold,
                            ),
                        ),
                      ],
                    ),
                  ),
              
                  const SizedBox(height: 10),
              
                  // email textfield
                  MyTextField(
                    controller: emailController,
                    obscureText: false,
                  ),
              
                  const SizedBox(height: 10),
              
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'PASSWORD:',
                          style: TextStyle(
                            color: Color(0xff503D2E),
                            fontFamily: 'Kodchasan',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  const SizedBox(height: 10),
              
                  // password textfield
                  MyTextField(
                    controller: passwordController,
                    obscureText: true,
                  ),
              
              
                  // forgot password?
                  
                  const SizedBox(height: 25),
              
                  // sign in button
                  MyButton(
                    text: 'Log In',
                    onTap: signUserIn,
                  ),
              
                  const SizedBox(height: 25),
              
                  // not a member? register now
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Forgot Password?',
                        style: TextStyle(
                          color: Color(0xff503D2E),
                          fontFamily: 'Kodchasan',
                          fontWeight: FontWeight.bold,
                          ),
                      ),
                    ],
                  ),
              
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have an account?",
                        style: TextStyle(
                          color: Color(0xff503D2E),
                          fontFamily: 'Kodchasan',
                          fontWeight: FontWeight.normal),
                      ),
                      const SizedBox(width:4),
                      GestureDetector(
                        onTap: navigateToUserType,
                        child: const Text(
                            'Sign up now!',
                            style: TextStyle(
                                    color: Color(0xff503D2E),
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Kodchasan'
                                  ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void navigateToUserType() {
    Navigator.push(
      context, 
      MaterialPageRoute(builder: (context) => UserType(onTap: navigateToUserType)));
  }
}