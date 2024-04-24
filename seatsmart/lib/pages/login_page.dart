import 'package:flutter/material.dart';
import 'package:modernlogintute/components/my_button.dart';
import 'package:modernlogintute/components/my_textfield.dart';
import 'package:modernlogintute/components/square_tile.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  // text editing controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  // sign user in method
  void signUserIn() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              // logo
              const Icon(
                Icons.lock,
                size: 100,
              ),

              const SizedBox(height: 50),


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

              // username textfield
              MyTextField(
                controller: usernameController,
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


              // forgot password?
              
              const SizedBox(height: 25),

              // sign in button
              MyButton(
                onTap: signUserIn,
              ),

              const SizedBox(height: 50),

              // not a member? register now
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Forgot Password?',
                    style: TextStyle(color: Color(0xff503D2E)),
                  ),
                ],
              ),

              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Sign Up!',
                    style: TextStyle(color: Color(0xff503D2E)),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
