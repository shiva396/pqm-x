import 'package:flutter/material.dart';

class EditTitleDialog extends StatelessWidget {
  final String initialTitle;
  final TextEditingController titleController;

  EditTitleDialog({super.key, required this.initialTitle})
      : titleController = TextEditingController(text: initialTitle);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.blue.shade50,
      title: const Text(
        'Edit Pond Name',
        style: TextStyle(color: Colors.black),
      ),
      content: TextField(
        controller: titleController,
        decoration: const InputDecoration(
          labelText: 'Pond Name',
          labelStyle: TextStyle(color: Colors.black),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
        ),
        style: const TextStyle(color: Colors.black),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          style: TextButton.styleFrom(
              backgroundColor: Colors.blue.shade100,
              foregroundColor: Colors.black87),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop(titleController.text.trim());
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue.shade300,
            foregroundColor: Colors.black87,
          ),
          child: const Text('Submit'),
        ),
      ],
    );
  }
}
