import 'package:flutter/material.dart';

class Dropdown extends StatelessWidget {
  final int numSystems;
  final ValueChanged<int?> onChanged;

  const Dropdown({
    super.key,
    required this.numSystems,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white, 
        borderRadius: BorderRadius.circular(100.0), 
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3), 
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0), 
        child: DropdownButton<int>(
          icon: const Icon(Icons.arrow_drop_down),
          underline: Container(), 
          items: List.generate(numSystems, (index) {
            return DropdownMenuItem<int>(
              value: index + 1,
              child: Text('System ${index + 1}'),
            );
          }),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
