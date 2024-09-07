import 'package:flutter/material.dart';

class Tab10Days extends StatelessWidget {
  const Tab10Days({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const SizedBox(height: 16),
          Expanded(
            child: Container(
              height: 200,
              width: 400,
              color: Colors.white,
              child: const Center(child: Text('10days graph here')),
            ),
          ),
        ],
      ),
    );
  }
}
