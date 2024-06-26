/* Authored by: Jared Oquindo
Company: LuminaTech
Project: SeatSmart
Feature: [SESM-003] Choose User Type Page
  User Chooses Which Type Of User They Are.
 */

import 'package:flutter/material.dart';
import 'package:seat_smart/components/image_banner.dart';
import 'package:seat_smart/pages/register_page.dart';


class UserType extends StatefulWidget {
  final Function()? onTap;
  const UserType({super.key, required this.onTap});

  @override
  State<UserType> createState() => _UserTypeState();
}

class _UserTypeState extends State<UserType> {

  void navigateToRegisterPage() async{
    Navigator.push(
      context, 
      MaterialPageRoute(builder: (context) => RegisterPage(onTap: navigateToRegisterPage)));
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

                const ImageBanner("lib/images/SESM.png"),

                const SizedBox(height: 30),

                const Padding(  
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'YOU ARE?',
                        style: TextStyle(
                          color: Color(0xff503D2E),
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 10),
                
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Please choose a user.',
                        style: TextStyle(color: Color(0xff503D2E)),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomButton(
                     onTap: navigateToRegisterPage,
                     text: 'TEACHER'
                    ),
                    const SizedBox(width: 5),
                    CustomButton(
                     onTap: navigateToRegisterPage,
                     text: 'STUDENT'
                    ),                    
                  ],
                ),
              ],
            ),
          ),
        ) 
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final Function()? onTap;
  final String text;

  const CustomButton({
    super.key, 
    required this.onTap, 
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(30),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          color: const Color(0xffE3A72F),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}