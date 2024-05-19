import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modernlogintute/components/custom_bottom_navigation_bar.dart';
import 'package:modernlogintute/pages/settings_page.dart';
import 'package:modernlogintute/pages/user_profile_page.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final user = FirebaseAuth.instance.currentUser;

  // Sign user out method
  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE7E7E7),
      body: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'DASHBOARD',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.normal,
                  color: Color(0xff503D2E),
                  fontFamily: 'ChangaOne',
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.25),
                        spreadRadius: 1, // Spread radius for the outer shadow
                        blurRadius: 4,
                        offset: const Offset(0, 4), // Changes the position of the shadow
                      ),
                      const BoxShadow(
                        color: Colors.white,
                        spreadRadius: -2, // Negative spread radius for the inset shadow
                        blurRadius: 6,
                        offset: Offset(0, -4), // Moves the shadow upward to create the indentation effect
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: GridView.builder(
                      padding: const EdgeInsets.all(16),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 164 / 110,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                      ),
                      itemCount: 6,
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                            color: index == 0 ? const Color(0xffE3A72F) : Colors.grey[300],
                            borderRadius: BorderRadius.circular(20), // Rounded corners for each grid item
                          ),
                          child: index == 0
                              ? const Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'ITMC',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.normal,
                                          fontFamily: 'ChangaOne',
                                        ),
                                      ),
                                      SizedBox(height: 8),
                                      Text(
                                        'MWF 7:30 - 9:00',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontFamily: 'ChangaOne',
                                          fontWeight: FontWeight.normal
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              : Center(
                                  child: Icon(Icons.add, color: Colors.grey[700]),
                                ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: IconButton(
                icon: const Icon(Icons.arrow_forward),
                onPressed: () {
                  signUserOut();
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10), // Added horizontal padding
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(50.0),
                  topRight: Radius.circular(50.0),
                ),
                child: Container(
                  color: const Color(0xffE3A72F),
                  child: CustomBottomNavigationBar( // Use the alias to differentiate
                    currentIndex: 1,
                    items: const [
                      CustomBottomNavigationBarItem( // Use the alias to differentiate
                        label: 'Profile',
                      ),
                      CustomBottomNavigationBarItem( // Use the alias to differentiate
                        label: 'Home',
                      ),
                      CustomBottomNavigationBarItem( // Use the alias to differentiate
                        label: 'Settings',
                      ),
                    ],
                    onTap: (index) {
                      if (index == 0) {
                        // Navigate to Profile
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => UserProfilePage()),
                        );
                      } else if (index == 1) {
                        // Navigate to Home
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => HomePage()),
                        );
                      } else if (index == 2) {
                        // Navigate to Settings
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SettingsPage()),
                        );
                      }
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
