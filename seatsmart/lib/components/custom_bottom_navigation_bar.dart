import 'package:flutter/material.dart';

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
