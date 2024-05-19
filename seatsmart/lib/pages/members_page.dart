import 'package:flutter/material.dart';
import 'package:modernlogintute/components/custom_bottom_navigation_bar.dart';
import 'package:modernlogintute/pages/attendance_page.dart';
import 'package:modernlogintute/pages/home_page.dart';
import 'package:modernlogintute/pages/seat_plan_page.dart';
import 'package:modernlogintute/pages/settings_page.dart';
import 'package:modernlogintute/pages/user_profile_page.dart';

class MembersPage extends StatelessWidget {
  final String gridItem;

  const MembersPage({Key? key, required this.gridItem}) : super(key: key);

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
      backgroundColor: const Color(0xffE7E7E7), // Set background color
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          },
        ),
        title: const Text(
          'Go Back?',
          style: TextStyle(
            fontFamily: 'ChangaOne',
            fontWeight: FontWeight.normal,
            color: Color(0xff503D2E),
          ),
        ),
        backgroundColor: const Color(0xffE7E7E7),
        elevation: 0, // Remove the AppBar shadow
      ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9, // 80% of screen width
          height: MediaQuery.of(context).size.height * 0.7, // 60% of screen height
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40.0),
            color: const Color(0xffE3A72F), // Container background color
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                offset: const Offset(0, 4),
                blurRadius: 6,
              ),
            ],
          ),
          child: Scrollbar(
            child: ListView.builder(
              itemCount: names.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 5.0),
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        offset: const Offset(0, 4),
                        blurRadius: 6,
                      ),
                    ],
                  ),
                  child: ListTile(
                    leading: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.grey.shade300, width: 2),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            offset: const Offset(0, 2),
                            blurRadius: 3,
                          ),
                        ],
                      ),
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 20,
                        foregroundColor: Colors.black,
                        child: Text(
                          names[index][0],
                          style: const TextStyle(
                            fontFamily: 'ChangaOne',
                            fontWeight: FontWeight.normal,
                            color: Color(0xff503D2E),
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      names[index],
                      style: const TextStyle(
                        fontFamily: 'ChangaOne',
                        fontWeight: FontWeight.normal,
                        color: Color(0xff503D2E),
                      ),
                    ),
                    onTap: () {
                      // Handle item tap
                    },
                  ),
                );
              },
            ),
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: 1,
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
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AttendancePage()),
            );
          } else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SeatPlanPage()),
            );
          }
        },
      ),
    );
  }
}
