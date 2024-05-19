import 'package:flutter/material.dart';

class ExistingItemPage extends StatelessWidget {
  final String gridItem;

  const ExistingItemPage({Key? key, required this.gridItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Existing Item Details'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Details of $gridItem', // Display details of the tapped grid item
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              // You can add more widgets here to display additional information about the grid item
            ],
          ),
        ),
      ),
    );
  }
}
