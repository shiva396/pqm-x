import 'package:flutter/material.dart';

class InputDialog extends StatefulWidget {
  const InputDialog({super.key});

  @override
  InputDialogState createState() => InputDialogState();
}

class InputDialogState extends State<InputDialog> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController landSqFeetController = TextEditingController();
  final TextEditingController numSystemsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        'Enter Pond Details',
        style: TextStyle(color: Colors.black), // Set title text color to black
      ),
      backgroundColor: Colors.blue.shade50,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: titleController,
            decoration: const InputDecoration(
              labelText: 'Pond Name',
              labelStyle: TextStyle(color: Colors.black), // Label text color
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black), // Underline color
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide:
                    BorderSide(color: Colors.black), // Focused underline color
              ),
            ),
            style: const TextStyle(
                color: Colors.black), // Text color inside TextField
          ),
          TextField(
            controller: landSqFeetController,
            decoration: const InputDecoration(
              labelText: 'Land Sq Feet',
              labelStyle: TextStyle(color: Colors.black), // Label text color
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black), // Underline color
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide:
                    BorderSide(color: Colors.black), // Focused underline color
              ),
            ),
            keyboardType: TextInputType.number,
            style: const TextStyle(
                color: Colors.black), // Text color inside TextField
          ),
          TextField(
            controller: numSystemsController,
            decoration: const InputDecoration(
              labelText: 'Number of Systems',
              labelStyle: TextStyle(color: Colors.black), // Label text color
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black), // Underline color
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide:
                    BorderSide(color: Colors.black), // Focused underline color
              ),
            ),
            keyboardType: TextInputType.number,
            style: const TextStyle(
                color: Colors.black), // Text color inside TextField
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          style: TextButton.styleFrom(
            foregroundColor: Colors.black87,
            backgroundColor:
                Colors.blue.shade100, // Text color for 'Cancel' button
          ),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            final String title = titleController.text.trim();
            final int? landSqFeet = int.tryParse(landSqFeetController.text);
            final int? numSystems = int.tryParse(numSystemsController.text);

            if (title.isNotEmpty && landSqFeet != null && numSystems != null) {
              Navigator.of(context).pop([title, landSqFeet, numSystems]);
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Please enter valid inputs')),
              );
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor:
                Colors.blue.shade300, // Background color for 'Submit' button
            foregroundColor: Colors.black87, // Text color for 'Submit' button
          ),
          child: const Text('Submit'),
        ),
      ],
    );
  }
}
