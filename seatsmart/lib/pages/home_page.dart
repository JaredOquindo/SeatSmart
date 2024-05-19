import 'package:flutter/material.dart';
import 'package:modernlogintute/components/custom_bottom_navigation_bar.dart';
import 'package:modernlogintute/pages/existing_item_page.dart';
import 'package:modernlogintute/pages/settings_page.dart';
import 'package:modernlogintute/pages/user_profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> gridItems = ['ITMC']; // Initial grid item

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
                        spreadRadius: 1,
                        blurRadius: 4,
                        offset: const Offset(0, 4),
                      ),
                      const BoxShadow(
                        color: Colors.white,
                        spreadRadius: -2,
                        blurRadius: 6,
                        offset: Offset(0, -4),
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
                      itemCount: gridItems.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            if (index < gridItems.length - 1 && gridItems[index] != null && gridItems[index].isNotEmpty) {
                              // If the grid item already has a value, redirect to a page
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ExistingItemPage(gridItem: gridItems[index])),
                              );
                            } else {
                              // If the grid item doesn't have a value, ask for input
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => InputPage()),
                              ).then((newItem) {
                                if (newItem != null) {
                                  setState(() {
                                    // Update grid with new item
                                    gridItems.insert(index, newItem);
                                  });
                                }
                              });
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: index < gridItems.length - 1 && gridItems[index] != null && gridItems[index].isNotEmpty
                                  ? const Color(0xffE3A72F) // Existing item color
                                  : const Color(0xffE7E7E7), // Default color
                              borderRadius: BorderRadius.circular(30), // Rounded corners for each grid item
                            ),
                            child: Center(
                              child: index < gridItems.length - 1 && gridItems[index] != null && gridItems[index].isNotEmpty
                                  ? Text(
                                      gridItems[index],
                                      style: TextStyle(
                                        color: Colors.white, // Text color for existing items
                                        fontSize: 20,
                                        fontWeight: FontWeight.normal,
                                        fontFamily: 'ChangaOne',
                                      ),
                                    )
                                  : Icon(Icons.add, color: Colors.grey[700]),
                            ),
                          ),
                        );
                      },
                    )


                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
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
                        // Do nothing or handle differently based on your app logic
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

// InputPage

class InputPage extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Input Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(labelText: 'Enter Details'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, _controller.text);
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
