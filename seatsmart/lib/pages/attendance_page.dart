import 'package:flutter/material.dart';
import 'package:seat_smart/components/custom_bottom_navigation_bar.dart';
import 'package:seat_smart/pages/members_page.dart';
import 'package:seat_smart/pages/seat_plan_page.dart';

class AttendancePage extends StatefulWidget {
  const AttendancePage({Key? key}) : super(key: key);

  @override
  _AttendancePageState createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
  // Initialize list of names
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

  // Initialize list to keep track of circle colors
  List<Color> circleColorsP = List.filled(12, Colors.white); // for "P" circle
  List<Color> circleColorsA = List.filled(12, Colors.white); // for "A" circle

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE7E7E7), // Set background color
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9, // 90% of screen width
          height: MediaQuery.of(context).size.height * 0.7, // 70% of screen height
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Student',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                      fontFamily: 'ChangaOne'
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        'P',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                          fontFamily: 'ChangaOne'
                        ),
                      ),
                      SizedBox(width: 5), // Add spacing between "P" and "A" labels
                      Text(
                        'A',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                          fontFamily: 'ChangaOne'
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Expanded(
                child: Scrollbar(
                  child: ListView.builder(
                    itemCount: names.length,
                    itemBuilder: (context, index) {
                      return SizedBox(
                        width: double.infinity,
                        child: Row(
                          children: [
                            Container(
                              width: 80, // Fixed width for avatar container
                              height: 80,
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
                            const SizedBox(width: 10), // Add spacing between avatar and name
                            Expanded(
                              child: Text(
                                names[index],
                                style: const TextStyle(
                                  fontFamily: 'ChangaOne',
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white,
                                  fontSize: 20
                                ),
                              ),
                            ),
                            const SizedBox(width: 20), // Add spacing between containers
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (circleColorsP[index] == Colors.white) {
                                    circleColorsP[index] = Colors.green;
                                  } else {
                                    circleColorsP[index] = Colors.white;
                                  }
                                });
                              },
                              child: Container(
                                width: 10,
                                height: 10,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: circleColorsP[index],
                                ),
                              ),
                            ),
                            const SizedBox(width: 5), // Add spacing between circles
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (circleColorsA[index] == Colors.white) {
                                    circleColorsA[index] = Colors.red;
                                  } else {
                                    circleColorsA[index] = Colors.white;
                                  }
                                });
                              },
                              child: Container(
                                width: 10,
                                height: 10,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: circleColorsA[index],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: 0,
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
          } else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (
context) => const SeatPlanPage()),
            );
          }
        },
      ),
    );
  }
}