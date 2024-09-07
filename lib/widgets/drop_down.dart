import 'package:flutter/material.dart';

class Dropdown extends StatefulWidget {
  final int numSystems;
  final ValueChanged<int?> onChanged;

  const Dropdown({
    super.key,
    required this.numSystems,
    required this.onChanged,
  });

  @override
  State<Dropdown> createState() => _DropdownState();
}

class _DropdownState extends State<Dropdown> {
  String value = 'System 1';

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
        child: DropdownButton<String>(
          hint: Text(value),
          icon: const Icon(Icons.arrow_drop_down),
          underline: Container(),
          items: List.generate(widget.numSystems, (index) {
            return DropdownMenuItem<String>(
              value: 'System ${index + 1}',
              child: Text('System ${index + 1}'),
            );
          }).toList(),
          onChanged: (v) {
            setState(() {
              value = v!;
            });
          },
        ),
      ),
    );
  }
}
