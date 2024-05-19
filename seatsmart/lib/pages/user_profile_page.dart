import 'package:flutter/material.dart';
import 'package:modernlogintute/pages/home_page.dart';
import 'package:modernlogintute/pages/settings_page.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({Key? key}) : super(key: key);

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
                    backgroundImage: AssetImage('assets/avatar_placeholder.png'),
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
              MaterialPageRoute(builder: (context) => HomePage()),
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

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final List<CustomBottomNavigationBarItem> items;
  final ValueChanged<int> onTap;

  const CustomBottomNavigationBar({
    Key? key,
    required this.currentIndex,
    required this.items,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      margin: const EdgeInsets.only(left: 10, right: 10),
      decoration: const BoxDecoration(
        color: Color(0xffE3A72F),
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(50.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: items.asMap().entries.map((entry) {
            final int itemIndex = entry.key;
            final CustomBottomNavigationBarItem item = entry.value;
            final isSelected = currentIndex == itemIndex;

            return GestureDetector(
              onTap: () => onTap(itemIndex),
              child: Container(
                decoration: BoxDecoration(
                  color: isSelected ? const Color(0xff503D2E) : const Color(0xffE3A72F),
                  borderRadius: BorderRadius.circular(50),
                ),
                padding: const EdgeInsets.all(8),
                child: Text(
                  item.label,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    fontFamily: 'ChangaOne',
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class CustomBottomNavigationBarItem {
  final String label;

  const CustomBottomNavigationBarItem({
    required this.label,
  });
}
