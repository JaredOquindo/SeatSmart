import 'package:flutter/material.dart';
import 'package:modernlogintute/components/custom_bottom_navigation_bar.dart';
import 'package:modernlogintute/pages/members_page.dart';
import 'package:modernlogintute/pages/settings_page.dart';
import 'package:modernlogintute/pages/user_profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> gridItems = ['ITMC']; // Initial grid items with one item

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
                      itemCount: gridItems.length + 1, // Add one for the add item
                      itemBuilder: (context, index) {
                        if (index < gridItems.length) {
                          // Render existing items
                          return GestureDetector(
                            onTap: () {
                              if (index == 0 && gridItems[index].isNotEmpty) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => MembersPage(gridItem: gridItems[index])),
                                );
                              } else if (index == 1 && gridItems[index].isEmpty) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => InputPage(index: index)),
                                ).then((result) {
                                  if (result != null && result['text'].isNotEmpty) {
                                    setState(() {
                                      gridItems[index] = result['text'];
                                    });
                                  }
                                });
                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: index == 0 ? const Color(0xffE3A72F) : const Color(0xffE7E7E7),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Center(
                                child: index == 0
                                    ? Text(
                                  gridItems[index],
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: 'ChangaOne',
                                  ),
                                )
                                    : Icon(Icons.add, color: Colors.grey[700],),
                              ),
                            ),
                          );
                        } else {
                          // Render add item button
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => InputPage(index: gridItems.length)),
                              ).then((result) {
                                if (result != null && result['text'].isNotEmpty) {
                                  setState(() {
                                    gridItems.add(result['text']);
                                  });
                                }
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color(0xffE7E7E7),
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(color: Colors.grey[700]!),
                              ),
                              child: Center(
                                child: Icon(Icons.add, color: Colors.grey[700],),
                              ),
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(50.0),
                  topRight: Radius.circular(50.0),
                ),
                child: Container(
                  color: const Color(0xffE3A72F),
                  child: CustomBottomNavigationBar(
                    currentIndex: 1,
                    items: const [
                      CustomBottomNavigationBarItem(
                        label: 'Profile',
                      ),
                      CustomBottomNavigationBarItem(
                        label: 'Home',
                      ),
                      CustomBottomNavigationBarItem(
                        label: 'Settings',
                      ),
                    ],
                    onTap: (index) {
                      if (index == 0) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const UserProfilePage()),
                        );
                      } else if (index == 2) {
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

class InputPage extends StatelessWidget {
  final int index;
  final TextEditingController _controller = TextEditingController();

  InputPage({required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Input Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(labelText: 'Enter Details'),
            ),
            ElevatedButton(
              onPressed: () {
                if (_controller.text.isNotEmpty) {
                  Navigator.pop(context, {'index': index, 'text': _controller.text});
                }
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
