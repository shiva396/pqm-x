import 'package:flutter/material.dart';

class CustomBottomNav extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemTapped;

  const CustomBottomNav({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    const Color backgroundColor = Color.fromRGBO(243, 243, 243, 1);
    return Container(
      padding: const EdgeInsets.all(10.0),
      color: backgroundColor,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: BottomAppBar(
          color: Colors.grey[850],
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(
                icon: const Icon(Icons.home, color: Colors.white),
                onPressed: () => onItemTapped(0),
              ),
              IconButton(
                icon: const Icon(Icons.notifications, color: Colors.white),
                onPressed: () => onItemTapped(1),
              ),
              IconButton(
                icon: const Icon(Icons.person, color: Colors.white),
                onPressed: () => onItemTapped(2),
              ),
              IconButton(
                icon: const Icon(Icons.settings, color: Colors.white),
                onPressed: () => onItemTapped(3),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
