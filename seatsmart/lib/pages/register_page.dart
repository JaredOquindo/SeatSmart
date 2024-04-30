/* Authored by: Jared Oquindo
Company: LuminaTech
Project: SeatSmart
Feature: [SESM-001] Registration Page
  User Inputs their Preffered Email and Password to create an account.
 */

// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modernlogintute/components/my_button.dart';
import 'package:modernlogintute/components/my_textfield.dart';
import 'package:modernlogintute/pages/home_page.dart';
import 'package:modernlogintute/pages/login_page.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();

  
}

class _RegisterPageState extends State<RegisterPage> {
  // text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  // sign user up method
  void signUserUp() async{

    // show loading circle
    showDialog(
      context: context, 
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator()
        );
      }
    );

    // try creating the user
    try {
      if (passwordController.text == confirmPasswordController.text){
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text, 
          password: passwordController.text
        );
      } else {
        showErrorMessage("Password don't match!");
      }
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
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
            
                const SizedBox(height: 25),
            
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'EMAIL:',
                        style: TextStyle(color: Color(0xff503D2E)),
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
                        style: TextStyle(color: Color(0xff503D2E)),
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
            
                const SizedBox(height: 10),
                // forgot password?
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'CONFIRM PASSWORD:',
                        style: TextStyle(color: Color(0xff503D2E)),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 10),

                // password textfield
                MyTextField(
                  controller: confirmPasswordController,
                  obscureText: true,
                ),

                const SizedBox(height: 25),

                // sign in button
                MyButton(
                  text: 'Sign Up',
                  onTap: signUserUp,
                ),
            
                const SizedBox(height: 25),
            
                // not a member? register now
            
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account?',
                      style: TextStyle(
                        color: Color(0xff503D2E)),
                    ),
                    const SizedBox(width:4),
                    GestureDetector(
                      onTap: navigateToLoginPage,
                      child: const Text(
                        'Login now!',
                        style: TextStyle(
                          color: Color(0xff503D2E),
                          fontWeight: FontWeight.bold,
                          ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void navigateToLoginPage() {
    Navigator.push(
      context, 
      MaterialPageRoute(builder: (context) => LoginPage(onTap: navigateToLoginPage)));
  }
}
