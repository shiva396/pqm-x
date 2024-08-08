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
      title: const Text('Enter Pond Details'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: titleController,
            decoration: const InputDecoration(
              labelText: 'Pond Name',
            ),
          ),
          TextField(
            controller: landSqFeetController,
            decoration: const InputDecoration(
              labelText: 'Land Sq Feet',
            ),
            keyboardType: TextInputType.number,
          ),
          TextField(
            controller: numSystemsController,
            decoration: const InputDecoration(
              labelText: 'Number of Systems',
            ),
            keyboardType: TextInputType.number,
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
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
          child: const Text('Submit'),
        ),
      ],
    );
  }
}
