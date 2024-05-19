import 'package:flutter/material.dart';
import 'package:modernlogintute/components/custom_bottom_navigation_bar.dart';
import 'package:modernlogintute/pages/members_page.dart';
import 'package:modernlogintute/pages/seat_plan_page.dart';

class AttendancePage extends StatelessWidget {
  const AttendancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Attendance'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Welcome to the Attendance Page!',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Implement logic to mark attendance
              },
              child: const Text('Mark Attendance'),
            ),
            const SizedBox(height: 16),
            const Text(
              'Total attendees: 50', // Replace with actual attendance count
              style: TextStyle(fontSize: 16),
            ),
          ],
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
              MaterialPageRoute(builder: (context) => SeatPlanPage()),
            );
          }
        },
      ),
    );
  }
}