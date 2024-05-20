import 'package:flutter/material.dart';
import 'package:seat_smart/components/custom_bottom_navigation_bar.dart';
import 'package:seat_smart/pages/home_page.dart';
import 'package:seat_smart/pages/settings_page.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE7E7E7),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            width: 300,
            height: 500,
            decoration: BoxDecoration(
              color: const Color(0xffE3A72F),
              borderRadius: BorderRadius.circular(50),
              border: Border.all(color: Colors.grey),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    radius: 50,
                  ),
                  const SizedBox(height: 16),
                  _buildTextWithBackground(
                    context,
                    label: 'NAME:',
                    text: 'Jared Raphael Oquindo',
                  ),
                  _buildTextWithBackground(
                    context,
                    label: 'EMAIL:',
                    text: 'joquindo@gbox.adnu.edu.ph',
                  ),
                  _buildTextWithBackground(
                    context,
                    label: 'DATE OF BIRTH:',
                    text: 'October 13, 2004',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: 0, // Set the current index of the selected tab
        items: const [
          CustomBottomNavigationBarItem(label: 'Profile'),
          CustomBottomNavigationBarItem(label: 'Home'),
          CustomBottomNavigationBarItem(label: 'Settings'),
        ],
        onTap: (index) {
          if (index == 0) {
            // Stay on the profile page
          } else if (index == 1) {
            // Navigate to Home
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
          } else if (index == 2) {
            // Navigate to Settings
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => SettingsPage()),
            );
          }
        },
      ),
    );
  }

  Widget _buildTextWithBackground(BuildContext context, {required String label, required String text}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16.0, bottom: 4.0),
          child: Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: Colors.white,
              fontFamily: 'Kodchasan',
            ),
          ),
        ),
        Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 14, fontFamily: 'ChangaOne'),
          ),
        ),
      ],
    );
  }
}