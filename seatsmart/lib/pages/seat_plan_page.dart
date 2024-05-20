import 'package:flutter/material.dart';
import 'package:seat_smart/components/custom_bottom_navigation_bar.dart';
import 'package:seat_smart/pages/attendance_page.dart';
import 'package:seat_smart/pages/members_page.dart';

class SeatPlanPage extends StatelessWidget {
  const SeatPlanPage({Key? key});

  @override
  Widget build(BuildContext context) {
    List<String> names = [
      'James Maderazo',
      'Angel Fajardo',
      'Joshua Castañeda',
      'Lawrence Cuadra',
      'Joshua Sapusao',
      'Stevens Fabriga',
      'Jared Oquindo',
      'Sophia Pasano',
      'Alexis Capua',
      'Trevor Galapate',
      'Benjamin Rivera',
      'Krizzane Ipo',
    ];

    return Scaffold(
      backgroundColor: const Color(0xffE7E7E7), // Set the entire page background color
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: 2,
        items: const [
          CustomBottomNavigationBarItem(
            label: 'Attendance',
          ),
          CustomBottomNavigationBarItem(
            label: 'Members',
          ),
          CustomBottomNavigationBarItem(
            label: 'Seat Plan',
          ),
        ],
        onTap: (index) {
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MembersPage(gridItem: '',)),
            );
          } else if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AttendancePage()),
            );
          }
        },
      ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9, // 90% of screen width
          height: MediaQuery.of(context).size.height * 0.7, // 70% of screen height
          decoration: BoxDecoration(
            color: Colors.white, // Set container color to white
            borderRadius: BorderRadius.circular(50), // Set border radius
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5), // Set shadow color
                spreadRadius: 5, // Set spread radius
                blurRadius: 7, // Set blur radius
                offset: const Offset(0, 3), // Set shadow offset
              ),
            ],
          ),
          padding: const EdgeInsets.all(16.0), // Add padding inside the container
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 1.2, // Extend the width for horizontal scrolling
              child: GridView.builder(
                itemCount: 30, // Total number of cells
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5, // 5 columns
                ),
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: const Color(0xffE7E7E7),
                      borderRadius: BorderRadius.circular(20), // Border radius for individual grid items
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5), // Set shadow color
                          spreadRadius: 2, // Set spread radius
                          blurRadius: 3, // Set blur radius
                          offset: const Offset(0, 2), // Set shadow offset
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        index < names.length ? names[index] : '', // Display name or leave empty
                        style: const TextStyle(
                          fontSize: 15,
                          fontFamily: 'ChangaOne',
                          fontWeight: FontWeight.normal,
                          color: Color(0xff503D2E),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
