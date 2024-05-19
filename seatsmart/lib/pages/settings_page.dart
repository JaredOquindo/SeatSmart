import 'package:flutter/material.dart';
import 'package:modernlogintute/pages/home_page.dart';
import 'package:modernlogintute/pages/user_profile_page.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE7E7E7), // Set the background color
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 100.0), // Add padding to move content down
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
                child: Text(
                  'Settings',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.normal,
                    fontFamily: 'ChangaOne',
                    color: Color(0xff503D2E),
                  ),
                ),
              ),
              const Divider(
                color: Color(0xff503D2E),
                thickness: 1,
                indent: 16,
                endIndent: 16,
              ),
              const SizedBox(height: 8.0),
              Expanded(
                child: ListView(
                  shrinkWrap: true, // Shrink the ListView to fit the content
                  padding: const EdgeInsets.all(16.0),
                  children: [
                    _buildListTile(
                      title: 'Account settings',
                      onTap: () {
                        // Navigate to account settings page
                      },
                    ),
                    _buildListTile(
                      title: 'Change name',
                      onTap: () {
                        // Navigate to change name page
                      },
                    ),
                    _buildListTile(
                      title: 'Notifications',
                      onTap: () {
                        // Navigate to notifications page
                      },
                    ),
                    _buildListTile(
                      title: 'About',
                      onTap: () {
                        // Navigate to about page
                      },
                    ),
                    const SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: () {
                        // Handle log out button press
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xffE3A72F), // Change the color to your desired color
                      ),
                      child: const Text(
                        'Log out',
                        style: TextStyle(
                          fontFamily: 'ChangaOne',
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: 2, // Set the current index of the selected tab
        items: const [
          CustomBottomNavigationBarItem(label: 'Profile'),
          CustomBottomNavigationBarItem(label: 'Home'),
          CustomBottomNavigationBarItem(label: 'Settings'),
        ],
        onTap: (index) {
          // Handle navigation logic here
          if (index == 0) {
            // Navigate to Profile
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const UserProfilePage()),
            );
          } else if (index == 1) {
            // Navigate to Home
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          } else if (index == 2) {
            // Stay on the settings page
          }
        },
      ),
    );
  }

  Widget _buildListTile({required String title, required VoidCallback onTap}) {
    return Stack(
      children: [
        ListTile(
          title: Text(
            title,
            style: const TextStyle(
              fontFamily: 'ChangaOne',
              fontWeight: FontWeight.normal,
              color: Color(0xff503D2E),
            ),
          ),
          trailing: const Icon(Icons.arrow_forward),
          onTap: onTap,
        ),
        const Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Divider(
            color:Color(0xff503D2E),
            thickness: 1,
            indent: 16,
            endIndent: 16,
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
